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

/* This file is included in all aby-files */

#include <my_base.h>			/* This includes global */
C_MODE_START
#include <my_pthread.h>
#include "aby.h"			/* Structs & some defines */
#include "my_tree.h"

/*
  When allocating keys /rows in the internal block structure, do it
  within the following boundaries.

  The challenge is to find the balance between allocate as few blocks
  as possible and keep memory consumption down.
*/

/* this is for logging - HARI */
int log_this(const char*);

#ifndef HDBE
#define HDBE(a) log_this(a);
#endif
/* end of logging - HARI */

#define HPA_MIN_RECORDS_IN_BLOCK 16
#define HPA_MAX_RECORDS_IN_BLOCK 8192

	/* Some extern variables */

extern LIST *aby_open_list,*aby_share_list;

#define test_active(info) \
if (!(info->update & HA_STATE_AKTIV))\
{ my_errno=HA_ERR_NO_ACTIVE_RECORD; DBUG_RETURN(-1); }
#define hpa_find_hash(A,B) ((HASH_INFO*) hpa_find_block((A),(B)))

	/* Find pos for record and update it in info->current_ptr */
#define hpa_find_record(info,pos) (info)->current_ptr= hpa_find_block(&(info)->s->block,pos)

typedef struct st_hpa_hash_info
{
  struct st_hpa_hash_info *next_key;
  uchar *ptr_to_rec;
} HASH_INFO;

typedef struct {
  HA_KEYSEG *keyseg;
  uint key_length;
  uint search_flag;
} aby_rb_param;
      
	/* Prototypes for intern functions */

extern HPA_SHARE *hpa_find_named_aby(const char *name);
extern int hpa_rectest(HPA_INFO *info,const uchar *old);
extern uchar *hpa_find_block(HPA_BLOCK *info,ulong pos);
extern int hpa_get_new_block(HPA_BLOCK *info, size_t* alloc_length);
extern void hpa_free(HPA_SHARE *info);
extern uchar *hpa_free_level(HPA_BLOCK *block,uint level,HPA_PTRS *pos,
			   uchar *last_pos);
extern int hpa_write_key(HPA_INFO *info, HPA_KEYDEF *keyinfo,
			const uchar *record, uchar *recpos);
extern int hpa_rb_write_key(HPA_INFO *info, HPA_KEYDEF *keyinfo, 
			   const uchar *record, uchar *recpos);
extern int hpa_rb_delete_key(HPA_INFO *info,HPA_KEYDEF *keyinfo,
			    const uchar *record,uchar *recpos,int flag);
extern int hpa_delete_key(HPA_INFO *info,HPA_KEYDEF *keyinfo,
			 const uchar *record,uchar *recpos,int flag);
extern HASH_INFO *_aby_find_hash(HPA_BLOCK *block,ulong pos);
extern uchar *hpa_search(HPA_INFO *info,HPA_KEYDEF *keyinfo,const uchar *key,
		       uint nextflag);
extern uchar *hpa_search_next(HPA_INFO *info, HPA_KEYDEF *keyinfo,
			    const uchar *key, HASH_INFO *pos);
extern ulong hpa_hashnr(HPA_KEYDEF *keyinfo,const uchar *key);
extern ulong hpa_rec_hashnr(HPA_KEYDEF *keyinfo,const uchar *rec);
extern ulong hpa_mask(ulong hashnr,ulong buffmax,ulong maxlength);
extern void hpa_movelink(HASH_INFO *pos,HASH_INFO *next_link,
			 HASH_INFO *newlink);
extern int hpa_rec_key_cmp(HPA_KEYDEF *keydef,const uchar *rec1,
			  const uchar *rec2,
                          my_bool diff_if_only_endspace_difference);
extern int hpa_key_cmp(HPA_KEYDEF *keydef,const uchar *rec,
		      const uchar *key);
extern void hpa_make_key(HPA_KEYDEF *keydef,uchar *key,const uchar *rec);
extern uint hpa_rb_make_key(HPA_KEYDEF *keydef, uchar *key,
			   const uchar *rec, uchar *recpos);
extern uint hpa_rb_key_length(HPA_KEYDEF *keydef, const uchar *key);
extern uint hpa_rb_null_key_length(HPA_KEYDEF *keydef, const uchar *key);
extern uint hpa_rb_var_key_length(HPA_KEYDEF *keydef, const uchar *key);
extern my_bool hpa_if_null_in_key(HPA_KEYDEF *keyinfo, const uchar *record);
extern int hpa_close(register HPA_INFO *info);
extern void hpa_clear(HPA_SHARE *info);
extern void hpa_clear_keys(HPA_SHARE *info);
extern uint hpa_rb_pack_key(HPA_KEYDEF *keydef, uchar *key, const uchar *old,
                           key_part_map keypart_map);

extern mysql_mutex_t THR_LOCK_heap;

#ifdef HAVE_PSI_INTERFACE
extern PSI_mutex_key hpa_key_mutex_HPA_SHARE_intern_lock;
void init_aby_psi_keys();
#endif /* HAVE_PSI_INTERFACE */

C_MODE_END
