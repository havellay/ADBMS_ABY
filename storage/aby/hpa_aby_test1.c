/* Copyright (c) 2000, 2011, Oracle and/or its affiliates. All rights reserved.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; version 2 of the License.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA */

/* Test av aby-database */
/* Programmet skapar en aby-databas. Till denna skrivs ett antal poster.
   Databasen st{ngs. D{refter |ppnas den p} nytt och en del av posterna
   raderas.
*/

#include <my_global.h>
#include <my_sys.h>
#include <m_string.h>
#include "aby.h"

static int get_options(int argc, char *argv[]);

static int flag=0,verbose=0,remove_ant=0,flags[50];

int main(int argc, char **argv)
{
  int i,j,error,deleted;
  HPA_INFO *file;
  uchar record[128],key[32];
  const char *filename;
  HPA_KEYDEF keyinfo[10];
  HA_KEYSEG keyseg[4];
  HPA_CREATE_INFO hpa_create_info;
  HPA_SHARE *tmp_share;
  my_bool unused;
  MY_INIT(argv[0]);

  filename= "test1";
  get_options(argc,argv);

  memset(&hpa_create_info, 0, sizeof(hpa_create_info));
  hpa_create_info.max_table_size= 1024L*1024L;
  hpa_create_info.keys= 1;
  hpa_create_info.keydef= keyinfo;
  hpa_create_info.reclength= 30;
  hpa_create_info.max_records= (ulong) flag*100000L;
  hpa_create_info.min_records= 10UL;

  keyinfo[0].keysegs=1;
  keyinfo[0].seg=keyseg;
  keyinfo[0].algorithm= HA_KEY_ALG_HASH;
  keyinfo[0].seg[0].type=HA_KEYTYPE_BINARY;
  keyinfo[0].seg[0].start=1;
  keyinfo[0].seg[0].length=6;
  keyinfo[0].seg[0].charset= &my_charset_latin1;
  keyinfo[0].seg[0].null_bit= 0;
  keyinfo[0].flag = HA_NOSAME;

  deleted=0;
  memset(flags, 0, sizeof(flags));

  printf("- Creating aby-file\n");
  if (aby_create(filename, &hpa_create_info, &tmp_share, &unused) ||
      !(file= aby_open(filename, 2)))
    goto err;
  printf("- Writing records:s\n");
  strmov((char*) record,"          ..... key           ");

  for (i=49 ; i>=1 ; i-=2 )
  {
    j=i%25 +1;
    sprintf((char*) key,"%6d",j);
    bmove(record+1,key,6);
    error=aby_write(file,record);
    if (aby_check_aby(file,0))
    {
      puts("Heap keys crashed");
      goto err;
    }
    flags[j]=1;
    if (verbose || error) printf("J= %2d  aby_write: %d  my_errno: %d\n",
       j,error,my_errno);
  }
  if (aby_close(file))
    goto err;
  printf("- Reopening file\n");
  if (!(file=aby_open(filename, 2)))
    goto err;

  printf("- Removing records\n");
  for (i=1 ; i<=10 ; i++)
  {
    if (i == remove_ant) { (void) aby_close(file); return (0) ; }
    sprintf((char*) key,"%6d",(j=(int) ((rand() & 32767)/32767.*25)));
    if ((error = aby_rkey(file,record,0,key,6,HA_READ_KEY_EXACT)))
    {
      if (verbose || (flags[j] == 1 ||
		      (error && my_errno != HA_ERR_KEY_NOT_FOUND)))
	printf("key: %s  rkey:   %3d  my_errno: %3d\n",(char*) key,error,my_errno);
    }
    else
    {
      error=aby_delete(file,record);
      if (error || verbose)
	printf("key: %s  delete: %d  my_errno: %d\n",(char*) key,error,my_errno);
      flags[j]=0;
      if (! error)
	deleted++;
    }
    if (aby_check_aby(file,0))
    {
      puts("Heap keys crashed");
      goto err;
    }
  }

  printf("- Reading records with key\n");
  for (i=1 ; i<=25 ; i++)
  {
    sprintf((char*) key,"%6d",i);
    bmove(record+1,key,6);
    my_errno=0;
    error=aby_rkey(file,record,0,key,6,HA_READ_KEY_EXACT);
    if (verbose ||
	(error == 0 && flags[i] != 1) ||
	(error && (flags[i] != 0 || my_errno != HA_ERR_KEY_NOT_FOUND)))
    {
      printf("key: %s  rkey: %3d  my_errno: %3d  record: %s\n",
             (char*) key,error,my_errno,record+1);
    }
  }

#ifdef OLD_ABY_VERSION
  {
    int found;
    printf("- Reading records with position\n");
    for (i=1,found=0 ; i <= 30 ; i++)
    {
      my_errno=0;
      if ((error=aby_rrnd(file,record,i == 1 ? 0L : (ulong) -1)) ==
	  HA_ERR_END_OF_FILE)
      {
	if (found != 25-deleted)
	  printf("Found only %d of %d records\n",found,25-deleted);
	break;
      }
      if (!error)
	found++;
      if (verbose || (error != 0 && error != HA_ERR_RECORD_DELETED))
      {
	printf("pos: %2d  ni_rrnd: %3d  my_errno: %3d  record: %s\n",
	       i-1,error,my_errno,(char*) record+1);
      }
    }
  }
#endif

  if (aby_close(file) || hpa_panic(HA_PANIC_CLOSE))
    goto err;
  my_end(MY_GIVE_INFO);
  return(0);
err:
  printf("got error: %d when using aby-database\n",my_errno);
  return(1);
} /* main */


/* Read options */

static int get_options(int argc, char **argv)
{
  char *pos;

  while (--argc >0 && *(pos = *(++argv)) == '-' ) {
    switch(*++pos) {
    case 'B':				/* Big file */
      flag=1;
      break;
    case 'v':				/* verbose */
      verbose=1;
      break;
    case 'm':
      remove_ant=atoi(++pos);
      break;
    case 'V':
      printf("hpa_aby_test1    Ver 3.0 \n");
      exit(0);
    case '#':
      DBUG_PUSH (++pos);
      break;
    }
  }
  return 0;
} /* get options */
