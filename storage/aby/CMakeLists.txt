# Copyright (c) 2006, 2010, Oracle and/or its affiliates. All rights reserved.
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA

SET(ABY_PLUGIN_STATIC  "aby")
SET(ABY_PLUGIN_MANDATORY  TRUE)

SET(ABY_SOURCES  _aby_check.c _aby_rectest.c hpa_block.c hpa_clear.c hpa_close.c hpa_create.c
				ha_aby.cc
				hpa_delete.c hpa_extra.c hpa_hash.c hpa_info.c hpa_open.c hpa_panic.c
				hpa_rename.c hpa_rfirst.c hpa_rkey.c hpa_rlast.c hpa_rnext.c hpa_rprev.c
				hpa_rrnd.c hpa_rsame.c hpa_scan.c hpa_static.c hpa_update.c hpa_write.c)

MYSQL_ADD_PLUGIN(aby ${ABY_SOURCES} STORAGE_ENGINE MANDATORY RECOMPILE_FOR_EMBEDDED)

IF(WITH_UNIT_TESTS)
  ADD_EXECUTABLE(hpa_aby_test1 hpa_aby_test1.c)
  TARGET_LINK_LIBRARIES(hpa_aby_test1 aby mysys)
  ADD_TEST(hpa_aby_test1 hpa_aby_test1)

  ADD_EXECUTABLE(hpa_aby_test2 hpa_aby_test2.c)
  TARGET_LINK_LIBRARIES(hpa_aby_test2 aby mysys)
  ADD_TEST(hpa_aby_test2 hpa_aby_test2)
ENDIF()
