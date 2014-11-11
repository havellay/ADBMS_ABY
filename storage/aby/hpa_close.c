/* Copyright (c) 2000, 2010, Oracle and/or its affiliates. All rights reserved.

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

/* close a aby-database */

#include "abydef.h"

	/* Close a database open by hpa_open() */
	/* Data is normally not deallocated */

int aby_close(HPA_INFO *info)
{
  int tmp;
  DBUG_ENTER("aby_close");
  HDBE("aby_close");
  mysql_mutex_lock(&THR_LOCK_heap);
  tmp= hpa_close(info);
  mysql_mutex_unlock(&THR_LOCK_heap);
  DBUG_RETURN(tmp);
}


int hpa_close(register HPA_INFO *info)
{
  int error=0;
  DBUG_ENTER("hpa_close");
  HDBE("hpa_close");
#ifndef DBUG_OFF
  if (info->s->changed && aby_check_aby(info,0))
  {
    error=my_errno=HA_ERR_CRASHED;
  }
#endif
  info->s->changed=0;
  if (info->open_list.data)
    aby_open_list=list_delete(aby_open_list,&info->open_list);
  if (!--info->s->open_count && info->s->delete_on_close)
    hpa_free(info->s);				/* Table was deleted */
  my_free(info);
  DBUG_RETURN(error);
}
