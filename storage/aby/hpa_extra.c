/* Copyright (c) 2000, 2004-2006 MySQL AB
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

/* Extra functions we want to do with a database */
/* - Set flags for quicker databasehandler */
/* - Set databasehandler to normal */
/* - Reset recordpointers as after open database */

#include "abydef.h"

static void aby_extra_keyflag(register HPA_INFO *info,
                               enum ha_extra_function function);


	/* set extra flags for database */

int aby_extra(register HPA_INFO *info, enum ha_extra_function function)
{
  DBUG_ENTER("aby_extra");

  switch (function) {
  case HA_EXTRA_RESET_STATE:
    aby_reset(info);
  case HA_EXTRA_NO_READCHECK:
    info->opt_flag&= ~READ_CHECK_USED;	/* No readcheck */
    break;
  case HA_EXTRA_READCHECK:
    info->opt_flag|= READ_CHECK_USED;
    break;
  case HA_EXTRA_CHANGE_KEY_TO_UNIQUE:
  case HA_EXTRA_CHANGE_KEY_TO_DUP:
    aby_extra_keyflag(info, function);
    break;
  default:
    break;
  }
  DBUG_RETURN(0);
} /* aby_extra */


int aby_reset(HPA_INFO *info)
{
  info->lastinx= -1;
  info->current_record= (ulong) ~0L;
  info->current_hash_ptr=0;
  info->update=0;
  info->next_block=0;
  thread_says_bye((pid_t)syscall(SYS_gettid));
  return 0;
}


/*
    Start/Stop Inserting Duplicates Into a Table, WL#1648.
 */
static void aby_extra_keyflag(register HPA_INFO *info,
                               enum ha_extra_function function)
{
  uint  idx;

  for (idx= 0; idx< info->s->keys; idx++)
  {
    switch (function) {
    case HA_EXTRA_CHANGE_KEY_TO_UNIQUE:
      info->s->keydef[idx].flag|= HA_NOSAME;
      break;
    case HA_EXTRA_CHANGE_KEY_TO_DUP:
      info->s->keydef[idx].flag&= ~(HA_NOSAME);
      break;
    default:
      break;
    }
  }
}
