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

/* open a aby-database */

#include "abydef.h"
#include "my_sys.h"

/*
  Open aby table based on HPA_SHARE structure
  
  NOTE
    This doesn't register the table in the open table list.
*/

HPA_INFO *aby_open_from_share(HPA_SHARE *share, int mode)
{
  HPA_INFO *info;
  DBUG_ENTER("aby_open_from_share");

  if (!(info= (HPA_INFO*) my_malloc((uint) sizeof(HPA_INFO) +
				  2 * share->max_key_length,
				  MYF(MY_ZEROFILL))))
  {
    DBUG_RETURN(0);
  }
  share->open_count++; 
  thr_lock_data_init(&share->lock,&info->lock,NULL);
  info->s= share;
  info->lastkey= (uchar*) (info + 1);
  info->recbuf= (uchar*) (info->lastkey + share->max_key_length);
  info->mode= mode;
  info->current_record= (ulong) ~0L;		/* No current record */
  info->lastinx= info->errkey= -1;
#ifndef DBUG_OFF
  info->opt_flag= READ_CHECK_USED;		/* Check when changing */
#endif
  DBUG_PRINT("exit",("aby: 0x%lx  reclength: %d  records_in_block: %d",
		     (long) info, share->reclength,
                     share->block.records_in_block));
  DBUG_RETURN(info);
}


/*
  Open aby table based on HPA_SHARE structure and register it
*/

HPA_INFO *aby_open_from_share_and_register(HPA_SHARE *share, int mode)
{
  HPA_INFO *info;
  DBUG_ENTER("aby_open_from_share_and_register");

  mysql_mutex_lock(&THR_LOCK_heap);
  if ((info= aby_open_from_share(share, mode)))
  {
    info->open_list.data= (void*) info;
    aby_open_list= list_add(aby_open_list,&info->open_list);
    /* Unpin the share, it is now pinned by the file. */
    share->open_count--;
  }
  mysql_mutex_unlock(&THR_LOCK_heap);
  DBUG_RETURN(info);
}


/**
  Dereference a ABY share and free it if it's not referenced.
  We don't check open_count for internal tables since they
  are always thread-local, i.e. referenced by a single thread.
*/
void aby_release_share(HPA_SHARE *share, my_bool internal_table)
{
  /* Couldn't open table; Remove the newly created table */
  if (internal_table)
    hpa_free(share);
  else
  {
    mysql_mutex_lock(&THR_LOCK_heap);
    if (--share->open_count == 0)
      hpa_free(share);
    mysql_mutex_unlock(&THR_LOCK_heap);
  }
}

/*
  Open aby table based on name

  NOTE
    This register the table in the open table list. so that it can be
    found by future aby_open() calls.
*/

HPA_INFO *aby_open(const char *name, int mode)
{
  HPA_INFO *info;
  HPA_SHARE *share;
  DBUG_ENTER("aby_open");

  mysql_mutex_lock(&THR_LOCK_heap);
  if (!(share= hpa_find_named_aby(name)))
  {
    my_errno= ENOENT;
    mysql_mutex_unlock(&THR_LOCK_heap);
    DBUG_RETURN(0);
  }
  if ((info= aby_open_from_share(share, mode)))
  {
    info->open_list.data= (void*) info;
    aby_open_list= list_add(aby_open_list,&info->open_list);
  }
  mysql_mutex_unlock(&THR_LOCK_heap);
  DBUG_RETURN(info);
}


/* map name to a aby-nr. If name isn't found return 0 */

HPA_SHARE *hpa_find_named_aby(const char *name)
{
  LIST *pos;
  HPA_SHARE *info;
  DBUG_ENTER("aby_find");
  DBUG_PRINT("enter",("name: %s",name));

  for (pos= aby_share_list; pos; pos= pos->next)
  {
    info= (HPA_SHARE*) pos->data;
    if (!strcmp(name, info->name))
    {
      DBUG_PRINT("exit", ("Old aby_database: 0x%lx", (long) info));
      DBUG_RETURN(info);
    }
  }
  DBUG_RETURN((HPA_SHARE *) 0);
}


