/* Copyright (c) 2000, 2012, Oracle and/or its affiliates. All rights reserved.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; version 2 of the License.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA */

/* remove current record in aby-database */

#include "abydef.h"

int aby_delete(HPA_INFO *info, const uchar *record)
{
  uchar *pos;
  HPA_SHARE *share=info->s;
  HPA_KEYDEF *keydef, *end, *p_lastinx;
  DBUG_ENTER("aby_delete");
  DBUG_PRINT("enter",("info: 0x%lx  record: 0x%lx", (long) info, (long) record));

  test_active(info);

  if (info->opt_flag & READ_CHECK_USED && hpa_rectest(info,record))
    DBUG_RETURN(my_errno);			/* Record changed */
  share->changed=1;

  if ( --(share->records) < share->blength >> 1) share->blength>>=1;

  if (ABY_LOCK == ABY_HEAP)
    pos=info->current_ptr;
  else if (ABY_LOCK == ABY_ROW)
  {
    // pos=info->current_ptr_array[((pid_t)syscall(SYS_gettid))%ROWTHRDS];
    store_address_in(
        &pos,
        info->current_ptr_array[((pid_t)syscall(SYS_gettid))%ROWTHRDS],
        ((pid_t)syscall(SYS_gettid))
    );
  }

  p_lastinx = share->keydef + info->lastinx;
  for (keydef = share->keydef, end = keydef + share->keys; keydef < end; 
       keydef++)
  {
    if ((*keydef->delete_key)(info, keydef, record, pos, keydef == p_lastinx))
      goto err;
  }

  info->update=HA_STATE_DELETED;
  *((uchar**) pos)=share->del_link;
  share->del_link=pos;
  pos[share->reclength]=0;		/* Record deleted */
  share->deleted++;
  info->current_hash_ptr=0;
#if !defined(DBUG_OFF) && defined(EXTRA_ABY_DEBUG)
  DBUG_EXECUTE("check_aby",aby_check_aby(info, 0););
#endif

  DBUG_RETURN(0);
err:
  if (++(share->records) == share->blength)
    share->blength+= share->blength;
  DBUG_RETURN(my_errno);
}


/*
  Remove one key from rb-tree
*/

int hpa_rb_delete_key(HPA_INFO *info, register HPA_KEYDEF *keyinfo,
		   const uchar *record, uchar *recpos, int flag)
{
  aby_rb_param custom_arg;
  uint old_allocated;
  int res;

  if (flag) 
    info->last_pos= NULL; /* For aby_rnext/aby_rprev */

  custom_arg.keyseg= keyinfo->seg;
  custom_arg.key_length= hpa_rb_make_key(keyinfo, info->recbuf, record, recpos);
  custom_arg.search_flag= SEARCH_SAME;
  old_allocated= keyinfo->rb_tree.allocated;
  res= tree_delete(&keyinfo->rb_tree, info->recbuf, custom_arg.key_length,
                   &custom_arg);
  info->s->index_length-= (old_allocated - keyinfo->rb_tree.allocated);
  return res;
}


/*
  Remove one key from hash-table

  SYNPOSIS
    hpa_delete_key()
    info		Hash handler
    keyinfo		key definition of key that we want to delete
    record		row data to be deleted
    recpos		Pointer to aby record in memory
    flag		Is set if we want's to correct info->current_ptr

  RETURN
    0      Ok
    other  Error code
*/

int hpa_delete_key(HPA_INFO *info, register HPA_KEYDEF *keyinfo,
		  const uchar *record, uchar *recpos, int flag)
{
  ulong blength, pos2, pos_hashnr, lastpos_hashnr, key_pos;
  HASH_INFO *lastpos,*gpos,*pos,*pos3,*empty,*last_ptr;
  HPA_SHARE *share=info->s;
  DBUG_ENTER("hpa_delete_key");

  blength=share->blength;
  if (share->records+1 == blength)
    blength+= blength;
  lastpos=hpa_find_hash(&keyinfo->block,share->records);
  last_ptr=0;

  /* Search after record with key */
  key_pos= hpa_mask(hpa_rec_hashnr(keyinfo, record), blength, share->records + 1);
  pos= hpa_find_hash(&keyinfo->block, key_pos);

  gpos = pos3 = 0;

  while (pos->ptr_to_rec != recpos)
  {
    if (flag && !hpa_rec_key_cmp(keyinfo, record, pos->ptr_to_rec, 0))
      last_ptr=pos;				/* Previous same key */
    gpos=pos;
    if (!(pos=pos->next_key))
    {
      DBUG_RETURN(my_errno=HA_ERR_CRASHED);	/* This shouldn't happend */
    }
  }

  /* Remove link to record */

  if (flag)
  {
    /* Save for aby_rnext/aby_rprev */
    info->current_hash_ptr=last_ptr;
    if (ABY_LOCK == ABY_HEAP)
    {
      info->current_ptr = last_ptr ? last_ptr->ptr_to_rec : 0;
      DBUG_PRINT("info",("Corrected current_ptr to point at: 0x%lx",
             (long) info->current_ptr));
    }
    else if (ABY_LOCK == ABY_ROW)
    {
      info->current_ptr_array[(pid_t)syscall(SYS_gettid)%ROWTHRDS]
        = last_ptr ? last_ptr->ptr_to_rec : 0;
      DBUG_PRINT("info",("Corrected current_ptr to point at: 0x%lx",
             (long) info->current_ptr_array[((pid_t)syscall(SYS_gettid))%ROWTHRDS]));
    }
  }
  empty=pos;
  if (gpos)
    gpos->next_key=pos->next_key;	/* unlink current ptr */
  else if (pos->next_key)
  {
    empty=pos->next_key;
    pos->ptr_to_rec=empty->ptr_to_rec;
    pos->next_key=empty->next_key;
  }
  else
    keyinfo->hash_buckets--;

  if (empty == lastpos)			/* deleted last hash key */
    DBUG_RETURN (0);

  /* Move the last key (lastpos) */
  lastpos_hashnr = hpa_rec_hashnr(keyinfo, lastpos->ptr_to_rec);
  /* pos is where lastpos should be */
  pos=hpa_find_hash(&keyinfo->block, hpa_mask(lastpos_hashnr, share->blength,
					    share->records));
  if (pos == empty)			/* Move to empty position. */
  {
    empty[0]=lastpos[0];
    DBUG_RETURN(0);
  }
  pos_hashnr = hpa_rec_hashnr(keyinfo, pos->ptr_to_rec);
  /* pos3 is where the pos should be */
  pos3= hpa_find_hash(&keyinfo->block,
		     hpa_mask(pos_hashnr, share->blength, share->records));
  if (pos != pos3)
  {					/* pos is on wrong posit */
    empty[0]=pos[0];			/* Save it here */
    pos[0]=lastpos[0];			/* This shold be here */
    hpa_movelink(pos, pos3, empty);	/* Fix link to pos */
    DBUG_RETURN(0);
  }
  pos2= hpa_mask(lastpos_hashnr, blength, share->records + 1);
  if (pos2 == hpa_mask(pos_hashnr, blength, share->records + 1))
  {					/* Identical key-positions */
    if (pos2 != share->records)
    {
      empty[0]=lastpos[0];
      hpa_movelink(lastpos, pos, empty);
      DBUG_RETURN(0);
    }
    pos3= pos;				/* Link pos->next after lastpos */
    /* 
      One of elements from the bucket we're scanning is moved to the
      beginning of the list. Reset search since this element may not have
      been processed yet. 
    */
    if (flag && pos2 == key_pos)
    {
      if (ABY_LOCK == ABY_HEAP)
        info->current_ptr= 0;
      else if (ABY_LOCK == ABY_ROW)
        info->current_ptr_array[(pid_t)syscall(SYS_gettid)%ROWTHRDS] = 0;
      info->current_hash_ptr= 0;
    }
  }
  else
  {
    pos3= 0;				/* Different positions merge */
    keyinfo->hash_buckets--;
  }

  empty[0]=lastpos[0];
  hpa_movelink(pos3, empty, pos->next_key);
  pos->next_key=empty;
  DBUG_RETURN(0);
}
