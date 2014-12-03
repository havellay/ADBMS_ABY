/*
   Copyright (c) 2000, 2011, Oracle and/or its affiliates. All rights reserved.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; version 2 of the License.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA
*/

/* This file should be included when using aby_database_functions */
/* Author: Michael Widenius */

#ifndef _aby_h
#define _aby_h
#ifdef	__cplusplus
extern "C" {
#endif

#ifndef _my_base_h
#include <my_base.h>
#endif

#include <my_pthread.h>
#include <thr_lock.h>

#include "my_compare.h"
#include "my_tree.h"

	/* defines used by aby-funktions */

#define HPA_MAX_LEVELS	4		/* 128^5 records is enough */
#define HPA_PTRS_IN_NOD	128

	/* struct used with aby_funktions */

typedef struct st_abyinfo		/* Struct from aby_info */
{
  ulong records;			/* Records in database */
  ulong deleted;			/* Deleted records in database */
  ulong max_records;
  ulonglong data_length;
  ulonglong index_length;
  uint reclength;			/* Length of one record */
  int errkey;
  ulonglong auto_increment;
  time_t create_time;
} ABYINFO;


	/* Structs used by aby-database-handler */

typedef struct st_aby_ptrs
{
  uchar *blocks[HPA_PTRS_IN_NOD];		/* pointers to HPA_PTRS or records */
} HPA_PTRS;

struct st_level_info
{
  /* Number of unused slots in *last_blocks HPA_PTRS block (0 for 0th level) */
  uint free_ptrs_in_block;
  
  /*
    Maximum number of records that can be 'contained' inside of each element
    of last_blocks array. For level 0 - 1, for level 1 - HPA_PTRS_IN_NOD, for 
    level 2 - HPA_PTRS_IN_NOD^2 and so forth.
  */
  ulong records_under_level;

  /*
    Ptr to last allocated HPA_PTRS (or records buffer for level 0) on this 
    level.
  */
  HPA_PTRS *last_blocks;			
};


/*
  Heap table records and hash index entries are stored in HPA_BLOCKs.
  HPA_BLOCK is used as a 'growable array' of fixed-size records. Size of record
  is recbuffer bytes.
  The internal representation is as follows:
  HPA_BLOCK is a hierarchical structure of 'blocks'.
  A block at level 0 is an array records_in_block records. 
  A block at higher level is an HPA_PTRS structure with pointers to blocks at 
  lower levels.
  At the highest level there is one top block. It is stored in HPA_BLOCK::root.

  See hpa_find_block for a description of how record pointer is obtained from 
  its index.
  See hpa_get_new_block 
*/

typedef struct st_aby_block
{
  HPA_PTRS *root;                        /* Top-level block */ 
  struct st_level_info level_info[HPA_MAX_LEVELS+1];
  uint levels;                          /* number of used levels */
  uint records_in_block;		/* Records in one aby-block */
  uint recbuffer;			/* Length of one saved record */
  ulong last_allocated; /* number of records there is allocated space for */
} HPA_BLOCK;

struct st_aby_info;			/* For referense */

typedef struct st_hpa_keydef		/* Key definition with open */
{
  uint flag;				/* HA_NOSAME | HA_NULL_PART_KEY */
  uint keysegs;				/* Number of key-segment */
  uint length;				/* Length of key (automatic) */
  uint8 algorithm;			/* HASH / BTREE */
  HA_KEYSEG *seg;
  HPA_BLOCK block;			/* Where keys are saved */
  /*
    Number of buckets used in hash table. Used only to provide
    #records estimates for aby key scans.
  */
  ha_rows hash_buckets; 
  TREE rb_tree;
  int (*write_key)(struct st_aby_info *info, struct st_hpa_keydef *keyinfo,
		   const uchar *record, uchar *recpos);
  int (*delete_key)(struct st_aby_info *info, struct st_hpa_keydef *keyinfo,
		   const uchar *record, uchar *recpos, int flag);
  uint (*get_key_length)(struct st_hpa_keydef *keydef, const uchar *key);
} HPA_KEYDEF;

typedef struct st_aby_share
{
  HPA_BLOCK block;
  HPA_KEYDEF  *keydef;
  ulong min_records,max_records;	/* Params to open */
  ulonglong data_length,index_length,max_table_size;
  uint key_stat_version;                /* version to indicate insert/delete */
  uint records;				/* records */
  uint blength;				/* records rounded up to 2^n */
  uint deleted;				/* Deleted records in database */
  uint reclength;			/* Length of one record */
  uint changed;
  uint keys,max_key_length;
  uint currently_disabled_keys;    /* saved value from "keys" when disabled */
  uint open_count;
  uchar *del_link;			/* Link to next block with del. rec */
  char * name;			/* Name of "memory-file" */
  time_t create_time;
  THR_LOCK lock;
  mysql_mutex_t intern_lock;            /* Locking for use with _locking */
  my_bool delete_on_close;
  LIST open_list;
  uint auto_key;
  uint auto_key_type;			/* real type of the auto key segment */
  ulonglong auto_increment;
} HPA_SHARE;

struct st_hpa_hash_info;

typedef struct st_aby_info
{
  HPA_SHARE *s;
  uchar *current_ptr;
  uchar *current_ptr_array[1000];
  struct st_hpa_hash_info *current_hash_ptr;
  ulong current_record,next_block;
  int lastinx,errkey;
  int  mode;				/* Mode of file (READONLY..) */
  uint opt_flag,update;
  uchar *lastkey;			/* Last used key with rkey */
  uchar *recbuf;                         /* Record buffer for rb-tree keys */
  enum ha_rkey_function last_find_flag;
  TREE_ELEMENT *parents[MAX_TREE_HEIGHT+1];
  TREE_ELEMENT **last_pos;
  uint lastkey_len;
  my_bool implicit_emptied;
  THR_LOCK_DATA lock;
  LIST open_list;
} HPA_INFO;


typedef struct st_aby_create_info
{
  HPA_KEYDEF *keydef;
  ulong max_records;
  ulong min_records;
  uint auto_key;                        /* keynr [1 - maxkey] for auto key */
  uint auto_key_type;
  uint keys;
  uint reclength;
  ulonglong max_table_size;
  ulonglong auto_increment;
  my_bool with_auto_increment;
  my_bool internal_table;
  /*
    TRUE if aby_create should 'pin' the created share by setting
    open_count to 1. Is only looked at if not internal_table.
  */
  my_bool pin_share;
} HPA_CREATE_INFO;

	/* Prototypes for aby-functions */

extern HPA_INFO *aby_open(const char *name, int mode);
extern HPA_INFO *aby_open_from_share(HPA_SHARE *share, int mode);
extern HPA_INFO *aby_open_from_share_and_register(HPA_SHARE *share, int mode);
extern void aby_release_share(HPA_SHARE *share, my_bool internal_table);
extern int aby_close(HPA_INFO *info);
extern int aby_write(HPA_INFO *info,const uchar *buff);
extern int aby_update(HPA_INFO *info,const uchar *old,const uchar *newdata);
extern int aby_rrnd(HPA_INFO *info,uchar *buf,uchar *pos);
extern int aby_scan_init(HPA_INFO *info);
extern int aby_scan(register HPA_INFO *info, uchar *record);
extern int aby_delete(HPA_INFO *info,const uchar *buff);
extern int aby_info(HPA_INFO *info,ABYINFO *x,int flag);
extern int aby_create(const char *name,
                       HPA_CREATE_INFO *create_info, HPA_SHARE **share,
                       my_bool *created_new_share);
extern int aby_delete_table(const char *name);
extern void aby_drop_table(HPA_INFO *info);
extern int aby_extra(HPA_INFO *info,enum ha_extra_function function);
extern int aby_reset(HPA_INFO *info);
extern int aby_rename(const char *old_name,const char *new_name);
extern int aby_panic(enum ha_panic_function flag);
extern int aby_rsame(HPA_INFO *info,uchar *record,int inx);
extern int aby_rnext(HPA_INFO *info,uchar *record);
extern int aby_rprev(HPA_INFO *info,uchar *record);
extern int aby_rfirst(HPA_INFO *info,uchar *record,int inx);
extern int aby_rlast(HPA_INFO *info,uchar *record,int inx);
extern void aby_clear(HPA_INFO *info);
extern void aby_clear_keys(HPA_INFO *info);
extern int aby_disable_indexes(HPA_INFO *info);
extern int aby_enable_indexes(HPA_INFO *info);
extern int aby_indexes_are_disabled(HPA_INFO *info);
extern void aby_update_auto_increment(HPA_INFO *info, const uchar *record);
ha_rows hpa_rb_records_in_range(HPA_INFO *info, int inx, key_range *min_key,
                               key_range *max_key);
int hpa_panic(enum ha_panic_function flag);
int aby_rkey(HPA_INFO *info, uchar *record, int inx, const uchar *key,
              key_part_map keypart_map, enum ha_rkey_function find_flag);
extern uchar * aby_find(HPA_INFO *info,int inx,const uchar *key);
extern int aby_check_aby(HPA_INFO *info, my_bool print_status);
extern uchar *aby_position(HPA_INFO *info);

/* The following is for programs that uses the old ABY interface where
   pointer to rows where a long instead of a (uchar*).
*/

#if defined(WANT_OLD_ABY_VERSION) || defined(OLD_ABY_VERSION)
extern int aby_rrnd_old(HPA_INFO *info,uchar *buf,ulong pos);
extern ulong aby_position_old(HPA_INFO *info);
#endif
#ifdef OLD_ABY_VERSION
typedef ulong ABY_PTR;
#define aby_position(A) aby_position_old(A)
#define aby_rrnd(A,B,C) aby_rrnd_old(A,B,C)
#else
typedef uchar *ABY_PTR;
#endif

#ifdef	__cplusplus
}
#endif
#endif
