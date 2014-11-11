/* Copyright (c) 2000, 2014, Oracle and/or its affiliates. All rights reserved.

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

#include "abydef.h"

static int keys_compare_aby(aby_rb_param *param, uchar *key1, uchar *key2);
static void init_block_aby(HPA_BLOCK *block,uint reclength,ulong min_records,
		       ulong max_records);

/* Create a aby table */

int aby_create(const char *name, HPA_CREATE_INFO *create_info,
                HPA_SHARE **res, my_bool *created_new_share)
{
  uint i, j, key_segs, max_length, length;
  HPA_SHARE *share= 0;
  HA_KEYSEG *keyseg;
  HPA_KEYDEF *keydef= create_info->keydef;
  uint reclength= create_info->reclength;
  uint keys= create_info->keys;
  ulong min_records= create_info->min_records;
  ulong max_records= create_info->max_records;
  DBUG_ENTER("aby_create");
  HDBE("aby_create");

  if (!create_info->internal_table)
  {
    mysql_mutex_lock(&THR_LOCK_heap);
    share= hpa_find_named_aby(name);
    if (share && share->open_count == 0)
    {
      hpa_free(share);
      share= 0;
    }
  }
  *created_new_share= (share == NULL);

  if (!share)
  {
    HPA_KEYDEF *keyinfo;
    DBUG_PRINT("info",("Initializing new table"));
    
    /*
      We have to store sometimes uchar* del_link in records,
      so the record length should be at least sizeof(uchar*)
    */
    set_if_bigger(reclength, sizeof (uchar*));
    
    for (i= key_segs= max_length= 0, keyinfo= keydef; i < keys; i++, keyinfo++)
    {
      memset(&keyinfo->block, 0, sizeof(keyinfo->block));
      memset(&keyinfo->rb_tree, 0, sizeof(keyinfo->rb_tree));
      for (j= length= 0; j < keyinfo->keysegs; j++)
      {
	length+= keyinfo->seg[j].length;
	if (keyinfo->seg[j].null_bit)
	{
	  length++;
	  if (!(keyinfo->flag & HA_NULL_ARE_EQUAL))
	    keyinfo->flag|= HA_NULL_PART_KEY;
	  if (keyinfo->algorithm == HA_KEY_ALG_BTREE)
	    keyinfo->rb_tree.size_of_element++;
	}
	switch (keyinfo->seg[j].type) {
	case HA_KEYTYPE_SHORT_INT:
	case HA_KEYTYPE_LONG_INT:
	case HA_KEYTYPE_FLOAT:
	case HA_KEYTYPE_DOUBLE:
	case HA_KEYTYPE_USHORT_INT:
	case HA_KEYTYPE_ULONG_INT:
	case HA_KEYTYPE_LONGLONG:
	case HA_KEYTYPE_ULONGLONG:
	case HA_KEYTYPE_INT24:
	case HA_KEYTYPE_UINT24:
	case HA_KEYTYPE_INT8:
	  keyinfo->seg[j].flag|= HA_SWAP_KEY;
          break;
        case HA_KEYTYPE_VARBINARY1:
          /* Case-insensitiveness is handled in coll->hash_sort */
          keyinfo->seg[j].type= HA_KEYTYPE_VARTEXT1;
          /* fall_through */
        case HA_KEYTYPE_VARTEXT1:
          keyinfo->flag|= HA_VAR_LENGTH_KEY;
          length+= 2;
          /* Save number of bytes used to store length */
          keyinfo->seg[j].bit_start= 1;
          break;
        case HA_KEYTYPE_VARBINARY2:
          /* Case-insensitiveness is handled in coll->hash_sort */
          /* fall_through */
        case HA_KEYTYPE_VARTEXT2:
          keyinfo->flag|= HA_VAR_LENGTH_KEY;
          length+= 2;
          /* Save number of bytes used to store length */
          keyinfo->seg[j].bit_start= 2;
          /*
            Make future comparison simpler by only having to check for
            one type
          */
          keyinfo->seg[j].type= HA_KEYTYPE_VARTEXT1;
          break;
	default:
	  break;
	}
      }
      keyinfo->length= length;
      length+= keyinfo->rb_tree.size_of_element + 
	       ((keyinfo->algorithm == HA_KEY_ALG_BTREE) ? sizeof(uchar*) : 0);
      if (length > max_length)
	max_length= length;
      key_segs+= keyinfo->keysegs;
      if (keyinfo->algorithm == HA_KEY_ALG_BTREE)
      {
        key_segs++; /* additional HA_KEYTYPE_END segment */
        if (keyinfo->flag & HA_VAR_LENGTH_KEY)
          keyinfo->get_key_length= hpa_rb_var_key_length;
        else if (keyinfo->flag & HA_NULL_PART_KEY)
          keyinfo->get_key_length= hpa_rb_null_key_length;
        else
          keyinfo->get_key_length= hpa_rb_key_length;
      }
    }
    if (!(share= (HPA_SHARE*) my_malloc((uint) sizeof(HPA_SHARE)+
				       keys*sizeof(HPA_KEYDEF)+
				       key_segs*sizeof(HA_KEYSEG),
				       MYF(MY_ZEROFILL))))
      goto err;
    share->keydef= (HPA_KEYDEF*) (share + 1);
    share->key_stat_version= 1;
    keyseg= (HA_KEYSEG*) (share->keydef + keys);
    init_block_aby(&share->block, reclength + 1, min_records, max_records);
	/* Fix keys */
    memcpy(share->keydef, keydef, (size_t) (sizeof(keydef[0]) * keys));
    for (i= 0, keyinfo= share->keydef; i < keys; i++, keyinfo++)
    {
      keyinfo->seg= keyseg;
      memcpy(keyseg, keydef[i].seg,
	     (size_t) (sizeof(keyseg[0]) * keydef[i].keysegs));
      keyseg+= keydef[i].keysegs;

      if (keydef[i].algorithm == HA_KEY_ALG_BTREE)
      {
	/* additional HA_KEYTYPE_END keyseg */
	keyseg->type=     HA_KEYTYPE_END;
	keyseg->length=   sizeof(uchar*);
	keyseg->flag=     0;
	keyseg->null_bit= 0;
	keyseg++;

	init_tree(&keyinfo->rb_tree, 0, 0, sizeof(uchar*),
		  (qsort_cmp2)keys_compare_aby, 1, NULL, NULL);
	keyinfo->delete_key= hpa_rb_delete_key;
	keyinfo->write_key= hpa_rb_write_key;
      }
      else
      {
	init_block_aby(&keyinfo->block, sizeof(HASH_INFO), min_records,
		   max_records);
	keyinfo->delete_key= hpa_delete_key;
	keyinfo->write_key= hpa_write_key;
        keyinfo->hash_buckets= 0;
      }
      if ((keyinfo->flag & HA_AUTO_KEY) && create_info->with_auto_increment)
        share->auto_key= i + 1;
    }
    share->min_records= min_records;
    share->max_records= max_records;
    share->max_table_size= create_info->max_table_size;
    share->data_length= share->index_length= 0;
    share->reclength= reclength;
    share->blength= 1;
    share->keys= keys;
    share->max_key_length= max_length;
    share->changed= 0;
    share->auto_key= create_info->auto_key;
    share->auto_key_type= create_info->auto_key_type;
    share->auto_increment= create_info->auto_increment;
    share->create_time= (long) time((time_t*) 0);
    /* Must be allocated separately for rename to work */
    if (!(share->name= my_strdup(name,MYF(0))))
    {
      my_free(share);
      goto err;
    }
    thr_lock_init(&share->lock);
    mysql_mutex_init(hpa_key_mutex_HPA_SHARE_intern_lock,
                     &share->intern_lock, MY_MUTEX_INIT_FAST);
    if (!create_info->internal_table)
    {
      share->open_list.data= (void*) share;
      aby_share_list= list_add(aby_share_list,&share->open_list);
    }
    else
      share->delete_on_close= 1;
  }
  if (!create_info->internal_table)
  {
    if (create_info->pin_share)
      ++share->open_count;
    mysql_mutex_unlock(&THR_LOCK_heap);
  }

  *res= share;
  DBUG_RETURN(0);

err:
  if (!create_info->internal_table)
    mysql_mutex_unlock(&THR_LOCK_heap);
  DBUG_RETURN(1);
} /* aby_create */


static int keys_compare_aby(aby_rb_param *param, uchar *key1, uchar *key2)
{
  uint not_used[2];
  return ha_key_cmp(param->keyseg, key1, key2, param->key_length, 
		    param->search_flag, not_used);
}

static void init_block_aby(HPA_BLOCK *block, uint reclength, ulong min_records,
		       ulong max_records)
{
  uint i,recbuffer,records_in_block;

  max_records= MY_MAX(min_records, max_records);
  if (!max_records)
    max_records= 1000;			/* As good as quess as anything */
  recbuffer= (uint) (reclength + sizeof(uchar**) - 1) & ~(sizeof(uchar**) - 1);
  records_in_block= max_records / 10;
  if (records_in_block < 10 && max_records)
    records_in_block= 10;
  if (!records_in_block || (ulonglong) records_in_block * recbuffer >
      (my_default_record_cache_size-sizeof(HPA_PTRS)*HPA_MAX_LEVELS))
    records_in_block= (my_default_record_cache_size - sizeof(HPA_PTRS) *
		      HPA_MAX_LEVELS) / recbuffer + 1;
  block->records_in_block= records_in_block;
  block->recbuffer= recbuffer;
  block->last_allocated= 0L;

  for (i= 0; i <= HPA_MAX_LEVELS; i++)
    block->level_info[i].records_under_level=
      (!i ? 1 : i == 1 ? records_in_block :
       HPA_PTRS_IN_NOD * block->level_info[i - 1].records_under_level);
}


static inline void aby_try_free(HPA_SHARE *share)
{
  if (share->open_count == 0)
    hpa_free(share);
  else
    share->delete_on_close= 1;
}


int aby_delete_table(const char *name)
{
  int result;
  reg1 HPA_SHARE *share;
  DBUG_ENTER("aby_delete_table");
  HDBE("aby_delete_table");

  mysql_mutex_lock(&THR_LOCK_heap);
  if ((share= hpa_find_named_aby(name)))
  {
    aby_try_free(share);
    result= 0;
  }
  else
  {
    result= my_errno=ENOENT;
  }
  mysql_mutex_unlock(&THR_LOCK_heap);
  DBUG_RETURN(result);
}


void aby_drop_table(HPA_INFO *info)
{
  DBUG_ENTER("aby_drop_table");
  HDBE("aby_drop_table");
  mysql_mutex_lock(&THR_LOCK_heap);
  aby_try_free(info->s);
  mysql_mutex_unlock(&THR_LOCK_heap);
  DBUG_VOID_RETURN;
}


void hpa_free(HPA_SHARE *share)
{
  if (share->open_list.data)                    /* If not internal table */
    aby_share_list= list_delete(aby_share_list, &share->open_list);
  hpa_clear(share);			/* Remove blocks from memory */
  thr_lock_delete(&share->lock);
  mysql_mutex_destroy(&share->intern_lock);
  my_free(share->name);
  my_free(share);
  return;
}