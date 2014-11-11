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

/* functions on blocks; Keys and records are saved in blocks */

#include "abydef.h"

/*
  Find record according to record-position.
      
  The record is located by factoring position number pos into (p_0, p_1, ...) 
  such that
     pos = SUM_i(block->level_info[i].records_under_level * p_i)
  {p_0, p_1, ...} serve as indexes to descend the blocks tree.
*/

uchar *hpa_find_block(HPA_BLOCK *block, ulong pos)
{
  reg1 int i;
  reg3 HPA_PTRS *ptr; /* block base ptr */

  for (i=block->levels-1, ptr=block->root ; i > 0 ; i--)
  {
    ptr=(HPA_PTRS*)ptr->blocks[pos/block->level_info[i].records_under_level];
    pos%=block->level_info[i].records_under_level;
  }
  return (uchar*) ptr+ pos*block->recbuffer;
}


/*
  Get one new block-of-records. Alloc ptr to block if needed

  SYNOPSIS
    hpa_get_new_block()
      block             HPA_BLOCK tree-like block
      alloc_length OUT  Amount of memory allocated from the aby
      
  Interrupts are stopped to allow ha_panic in interrupts 
  RETURN
    0  OK
    1  Out of memory
*/

int hpa_get_new_block(HPA_BLOCK *block, size_t *alloc_length)
{
  reg1 uint i,j;
  HPA_PTRS *root;

  for (i=0 ; i < block->levels ; i++)
    if (block->level_info[i].free_ptrs_in_block)
      break;

  /*
    Allocate space for leaf block plus space for upper level blocks up to
    first level that has a free slot to put the pointer. 
    In some cases we actually allocate more then we need:
    Consider e.g. a situation where we have one level 1 block and one level 0
    block, the level 0 block is full and this function is called. We only 
    need a leaf block in this case. Nevertheless, we will get here with i=1 
    and will also allocate sizeof(HPA_PTRS) for non-leaf block and will never 
    use this space.
    This doesn't add much overhead - with current values of sizeof(HPA_PTRS) 
    and my_default_record_cache_size we get about 1/128 unused memory.
   */
  *alloc_length= sizeof(HPA_PTRS)* i + (ulonglong) block->records_in_block *
                                              block->recbuffer;
  if (!(root=(HPA_PTRS*) my_malloc(*alloc_length,MYF(MY_WME))))
    return 1;

  if (i == 0)
  {
    block->levels=1;
    block->root=block->level_info[0].last_blocks=root;
  }
  else
  {
    if ((uint) i == block->levels)
    {
      /* Adding a new level on top of the existing ones. */
      block->levels=i+1;
      /*
        Use first allocated HPA_PTRS as a top-level block. Put the current
        block tree into the first slot of a new top-level block.
      */
      block->level_info[i].free_ptrs_in_block=HPA_PTRS_IN_NOD-1;
      ((HPA_PTRS**) root)[0]= block->root;
      block->root=block->level_info[i].last_blocks= root++;
    }
    /* Occupy the free slot we've found at level i */
    block->level_info[i].last_blocks->
      blocks[HPA_PTRS_IN_NOD - block->level_info[i].free_ptrs_in_block--]=
	(uchar*) root;
    
    /* Add a block subtree with each node having one left-most child */
    for (j=i-1 ; j >0 ; j--)
    {
      block->level_info[j].last_blocks= root++;
      block->level_info[j].last_blocks->blocks[0]=(uchar*) root;
      block->level_info[j].free_ptrs_in_block=HPA_PTRS_IN_NOD-1;
    }
    
    /* 
      root now points to last (block->records_in_block* block->recbuffer)
      allocated bytes. Use it as a leaf block.
    */
    block->level_info[0].last_blocks= root;
  }
  return 0;
}


	/* free all blocks under level */

uchar *hpa_free_level(HPA_BLOCK *block, uint level, HPA_PTRS *pos, uchar *last_pos)
{
  int i,max_pos;
  uchar *next_ptr;

  if (level == 1)
    next_ptr=(uchar*) pos+block->recbuffer;
  else
  {
    max_pos= (block->level_info[level-1].last_blocks == pos) ?
      HPA_PTRS_IN_NOD - block->level_info[level-1].free_ptrs_in_block :
    HPA_PTRS_IN_NOD;

    next_ptr=(uchar*) (pos+1);
    for (i=0 ; i < max_pos ; i++)
      next_ptr=hpa_free_level(block,level-1,
			      (HPA_PTRS*) pos->blocks[i],next_ptr);
  }
  if ((uchar*) pos != last_pos)
  {
    my_free(pos);
    return last_pos;
  }
  return next_ptr;			/* next memory position */
}
