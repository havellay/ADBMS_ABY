/* Copyright (c) 2000, 2002, 2005, 2006 MySQL AB, 2009 Sun Microsystems, Inc.
   Use is subject to license terms.

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

	/* if flag == HA_PANIC_CLOSE then all files are removed for more
	   memory */

int hpa_panic(enum ha_panic_function flag)
{
  LIST *element,*next_open;
  DBUG_ENTER("hpa_panic");

  mysql_mutex_lock(&THR_LOCK_heap);
  for (element=aby_open_list ; element ; element=next_open)
  {
    HPA_INFO *info=(HPA_INFO*) element->data;
    next_open=element->next;	/* Save if close */
    switch (flag) {
    case HA_PANIC_CLOSE:
      hpa_close(info);
      break;
    default:
      break;
    }
  }
  for (element=aby_share_list ; element ; element=next_open)
  {
    HPA_SHARE *share=(HPA_SHARE*) element->data;
    next_open=element->next;	/* Save if close */
    switch (flag) {
    case HA_PANIC_CLOSE:
    {
      if (!share->open_count)
	hpa_free(share);
      break;
    }
    default:
      break;
    }
  }
  mysql_mutex_unlock(&THR_LOCK_heap);
  DBUG_RETURN(0);
} /* hpa_panic */
