/* Copyright (c) 2000-2002, 2004-2008 MySQL AB
   Use is subject to license terms

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

/* Update current record in aby-database */

#include "abydef.h"

int aby_update(HPA_INFO *info, const uchar *old, const uchar *aby_new)
{
  HPA_KEYDEF *keydef, *end, *p_lastinx;
  uchar *pos;
  my_bool auto_key_changed= 0;
  HPA_SHARE *share= info->s;
  DBUG_ENTER("aby_update");

  test_active(info);
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

  if (info->opt_flag & READ_CHECK_USED && hpa_rectest(info,old))
    DBUG_RETURN(my_errno);				/* Record changed */
  if (--(share->records) < share->blength >> 1) share->blength>>= 1;
  share->changed=1;

  p_lastinx= share->keydef + info->lastinx;
  for (keydef= share->keydef, end= keydef + share->keys; keydef < end; keydef++)
  {
    if (hpa_rec_key_cmp(keydef, old, aby_new, 0))
    {
      if ((*keydef->delete_key)(info, keydef, old, pos, keydef == p_lastinx) ||
          (*keydef->write_key)(info, keydef, aby_new, pos))
        goto err;
      if (share->auto_key == (uint) (keydef - share->keydef + 1))
        auto_key_changed= 1;
    }
  }

  memcpy(pos,aby_new,(size_t) share->reclength);
  if (++(share->records) == share->blength) share->blength+= share->blength;

#if !defined(DBUG_OFF) && defined(EXTRA_ABY_DEBUG)
  DBUG_EXECUTE("check_aby",aby_check_aby(info, 0););
#endif
  if (auto_key_changed)
    aby_update_auto_increment(info, aby_new);
  DBUG_RETURN(0);

 err:
  if (my_errno == HA_ERR_FOUND_DUPP_KEY)
  {
    info->errkey = (int) (keydef - share->keydef);
    if (keydef->algorithm == HA_KEY_ALG_BTREE)
    {
      /* we don't need to delete non-inserted key from rb-tree */
      if ((*keydef->write_key)(info, keydef, old, pos))
      {
        if (++(share->records) == share->blength)
	  share->blength+= share->blength;
        DBUG_RETURN(my_errno);
      }
      keydef--;
    }
    while (keydef >= share->keydef)
    {
      if (hpa_rec_key_cmp(keydef, old, aby_new, 0))
      {
	if ((*keydef->delete_key)(info, keydef, aby_new, pos, 0) ||
	    (*keydef->write_key)(info, keydef, old, pos))
	  break;
      }
      keydef--;
    }
  }
  if (++(share->records) == share->blength)
    share->blength+= share->blength;
  DBUG_RETURN(my_errno);
} /* aby_update */
