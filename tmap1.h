
//{{BLOCK(tmap1)

//======================================================================
//
//	tmap1, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 14 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 448 + 2048 = 3008
//
//	Time-stamp: 2023-10-30, 17:18:02
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TMAP1_H
#define GRIT_TMAP1_H

#define tmap1TilesLen 448
extern const unsigned short tmap1Tiles[224];

#define tmap1MapLen 2048
extern const unsigned short tmap1Map[1024];

#define tmap1PalLen 512
extern const unsigned short tmap1Pal[256];

#endif // GRIT_TMAP1_H

//}}BLOCK(tmap1)
