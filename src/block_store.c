#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "bitmap.h"
#include "block_store.h"
// include more if you need

#define numblocks 256    //2^8
#define blocksize 256    //2^8

typedef struct block_store{
	bitmap_t* bitmap;
	char* data[numblocks-1][blocksize-1];	
} block_store_t;

block_store_t *block_store_create(){
	block_store_t * bs = malloc(sizeof(block_store_t));
	if(bs!=NULL){
		bs->bitmap = bitmap_create(blocksize-1);
		return bs;
	}
	return NULL;
}

void block_store_destroy(block_store_t *const bs){
	if(bs!=NULL){
		if(bs->bitmap!=NULL){
			bitmap_destroy(bs->bitmap);
		}
		free(bs);
	}
}

size_t block_store_allocate(block_store_t *const bs){
	if(bs!=NULL && bs->bitmap!=NULL){
		size_t ffz = bitmap_ffz(bs->bitmap);
		
		if(ffz<SIZE_MAX){
			bitmap_set(bs->bitmap, ffz);
			return ffz;
		}
		
	}
	return SIZE_MAX;
}

bool block_store_request(block_store_t *const bs, const size_t block_id){
	if(bs!=NULL && bs->bitmap!=NULL && block_id<=numblocks){
		if(!bitmap_test(bs->bitmap, block_id)){
			bitmap_set(bs->bitmap, block_id);
			return true;
		}
	}
	return false;
}

///
/// Frees the specified block
/// \param bs BS device
/// \param block_id The block to free
///
void block_store_release(block_store_t *const bs, const size_t block_id){
	if(bs!=NULL && bs->bitmap!=NULL &&  block_id<=numblocks){
		bitmap_reset(bs->bitmap, block_id);
		return;
	}
}

///
/// Counts the number of blocks marked as in use
/// \param bs BS device
/// \return Total blocks in use, SIZE_MAX on error
///
size_t block_store_get_used_blocks(const block_store_t *const bs){
	if(bs!=NULL && bs->bitmap!=NULL){
		return bitmap_total_set(bs->bitmap);
	}
	return SIZE_MAX;
}

///
/// Counts the number of blocks marked free for use
/// \param bs BS device
/// \return Total blocks free, SIZE_MAX on error
///
size_t block_store_get_free_blocks(const block_store_t *const bs){
	if(bs!=NULL && bs->bitmap!=NULL){
		return (numblocks-1) - bitmap_total_set(bs->bitmap);
	}
	return SIZE_MAX;
}

///
/// Returns the total number of user-addressable blocks
///  (since this is constant, you don't even need the bs object)
/// \return Total blocks
///
size_t block_store_get_total_blocks(){
	return numblocks-1;
}

///
/// Reads data from the specified block and writes it to the designated buffer
/// \param bs BS device
/// \param block_id Source block id
/// \param buffer Data buffer to write to
/// \return Number of bytes read, 0 on error
///
size_t block_store_read(const block_store_t *const bs, const size_t block_id, void *buffer){
	if(bs!=NULL && bs->bitmap!=NULL && block_id<=numblocks && buffer!=NULL){
		memcpy(buffer, bs->data[block_id], blocksize);
		return blocksize;
	}
	return 0;
}

///
/// Reads data from the specified buffer and writes it to the designated block
/// \param bs BS device
/// \param block_id Destination block id
/// \param buffer Data buffer to read from
/// \return Number of bytes written, 0 on error
///
size_t block_store_write(block_store_t *const bs, const size_t block_id, const void *buffer){
	if(bs!=NULL && bs->bitmap!=NULL && block_id<=numblocks && buffer!=NULL){
		memcpy(bs->data[block_id], buffer, blocksize);
		return blocksize;
	}
	return 0;
}





















