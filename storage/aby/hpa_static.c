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

/*
  Static variables for aby library. All definied here for easy making of
  a shared library
*/

#ifndef MY_GLOBAL_INCLUDED
#include "abydef.h"
#endif

LIST *aby_open_list=0,*aby_share_list=0;

#ifdef HAVE_PSI_INTERFACE
PSI_mutex_key hpa_key_mutex_HPA_SHARE_intern_lock;

static PSI_mutex_info all_aby_mutexes[]=
{
  { & hpa_key_mutex_HPA_SHARE_intern_lock, "HPA_SHARE::intern_lock", 0}
  /*
    Note:
    THR_LOCK_heap is part of mysys, not storage/aby.
  */
};

void init_aby_psi_keys()
{
  const char* category= "memory";
  int count;

  count= array_elements(all_aby_mutexes);
  mysql_mutex_register(category, all_aby_mutexes, count);
}
#endif /* HAVE_PSI_INTERFACE */


