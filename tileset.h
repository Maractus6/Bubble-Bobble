
//{{BLOCK(tileset)

//======================================================================
//
//	tileset, 256x256@4, 
//	+ 4 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 128 + 2048 = 2176
//
//	Time-stamp: 2023-10-25, 22:20:16
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TILESET_H
#define GRIT_TILESET_H

#define tilesetTilesLen 128
extern const unsigned short tilesetTiles[64];

#define tilesetMapLen 2048
extern const unsigned short tilesetMap[1024];

#endif // GRIT_TILESET_H

//}}BLOCK(tileset)
