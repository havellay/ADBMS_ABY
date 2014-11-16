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
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA */

/* Returns info about database status */

#include "abydef.h"


uchar *aby_position(HPA_INFO *info)
{
  if (ABY_LOCK == ABY_HEAP)
    return ((info->update & HA_STATE_AKTIV) ? info->current_ptr :
      (ABY_PTR) 0);
  else if (ABY_LOCK == ABY_ROW)
    return ((info->update & HA_STATE_AKTIV) ?
        info->current_ptr_array[((pid_t)syscall(SYS_gettid))%ROWTHRDS] :
      (ABY_PTR) 0);
}


#ifdef WANT_OLD_ABY_VERSION

/*
  The following should NOT be used anymore as this can't be used together with
   aby_rkey()
*/

ulong aby_position_old(HPA_INFO *info)
{
  return ((info->update & HA_STATE_AKTIV) ? info->current_record :
	  (ulong) ~0L);
}

#endif /* WANT_OLD_ABY_CODE */

/* Note that aby_info does NOT return information about the
   current position anymore;  Use aby_position instead */

int aby_info(reg1 HPA_INFO *info,reg2 ABYINFO *x, int flag )
{
  DBUG_ENTER("aby_info");
  x->records         = info->s->records;
  x->deleted         = info->s->deleted;
  x->reclength       = info->s->reclength;
  x->data_length     = info->s->data_length;
  x->index_length    = info->s->index_length;
  x->max_records     = info->s->max_records;
  x->errkey          = info->errkey;
  x->create_time     = info->s->create_time;
  if (flag & HA_STATUS_AUTO)
    x->auto_increment= info->s->auto_increment + 1;
  DBUG_RETURN(0);
} /* aby_info */
