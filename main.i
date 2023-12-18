# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 48 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 67 "gba.h"
extern unsigned short oldButtons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 98 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "main.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];

struct attr0 {
  u16 regular;
  u16 affine;
  u16 hide;
  u16 double_affine;
  u16 enable_alpha;
  u16 enable_window;
  u16 enable_mosaic;
  u16 fourBpp;
  u16 eightBpp;
  u16 square;
  u16 wide;
  u16 tall;
};

struct attr1 {
  u16 hflip;
  u16 vflip;
  u16 tiny;
  u16 small;
  u16 medium;
  u16 large;
};

struct oam_attrs {
  struct attr0 attr0;
  struct attr1 attr1;
};
# 93 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex;
} SPRITE;
# 4 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "main.c" 2
# 1 "tilemap.h" 1







extern const unsigned short tilemapMap[1024];
# 6 "main.c" 2
# 1 "tilemap1.h" 1
# 21 "tilemap1.h"
extern const unsigned short tilemap1Tiles[64];


extern const unsigned short tilemap1Map[1024];
# 7 "main.c" 2
# 1 "tilemap2.h" 1
# 21 "tilemap2.h"
extern const unsigned short tilemap2Tiles[96];


extern const unsigned short tilemap2Map[1024];
# 8 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 9 "main.c" 2
# 1 "PurpleRocks.h" 1
# 21 "PurpleRocks.h"
extern const unsigned short PurpleRocksTiles[16384];


extern const unsigned short PurpleRocksPal[256];
# 10 "main.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[3600];


extern const unsigned short backgroundMap[1024];


extern const unsigned short backgroundPal[256];
# 11 "main.c" 2
# 1 "game1.h" 1





# 1 "player.h" 1
# 9 "player.h"
typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int height;
    int width;
    int score;
    int isMoving;
    int timeUntilNextFrame;
    int currentFrame;
    int numFrames;
    char grounded;
    char direction;
} PLAYER;

typedef struct {
    int x;
    int y;
    int yVel;
    int height;
    int width;
    int active;
    int OAMIndex;
} BUBBLE;

PLAYER player;
OBJ_ATTR shadowOAM[128];
BUBBLE bubbleArray[20];
extern int score;

enum {GROUNDED = 0, AIRBORNE = 1, JUMPING = 2};
int playerState;
int jumpFrames;


void initPlayer(PLAYER* player);
void drawPlayer(PLAYER* player);
void updatePlayer(PLAYER* player);
void createBubble(PLAYER* player, BUBBLE bubbleArray[20]);
void updateBubbles(BUBBLE bubbleArray[20]);
void initBubbles(BUBBLE bubbleArray[20]);
void drawBubbles(BUBBLE bubbleArray[20]);
# 7 "game1.h" 2

extern int lives;
extern int score;
extern int enemyFrames;

typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int OAMIndex;
    int height;
    int width;
    int active;
    int trapped;
    int food;
    int frameCount;
    int foodanimating;
    int timeUntilNextFrame;
    int currentFrame;
    int numFrames;
    char direction;
} RIN;

void initGame1();
void updateGame1();
void drawGame1();
void drawRin();
void BubbleCollisionWithRin();
void playerCollisionRin(PLAYER* player);
void drawEnemyRin();
void drawScore();
# 12 "main.c" 2
# 1 "game2.h" 1





typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int OAMIndex;
    int height;
    int width;
    int active;
    int trapped;
    int food;
    int frameCount;
    int foodanimating;
    int timeUntilNextFrame;
    int currentFrame;
    int numFrames;
    char direction;
} SAYORI;

void initGame2();
void updateGame2();
void drawGame2();
void drawSayori();
void playerCollisionWithSayori(PLAYER* player);
void updateSayori(PLAYER* player);
void drawEnemySayor();
# 13 "main.c" 2

# 1 "tmap1.h" 1
# 22 "tmap1.h"
extern const unsigned short tmap1Tiles[224];


extern const unsigned short tmap1Map[1024];


extern const unsigned short tmap1Pal[256];
# 15 "main.c" 2
# 1 "col1.h" 1
# 20 "col1.h"
extern const unsigned short col1Bitmap[19200];
# 16 "main.c" 2
# 1 "col2.h" 1
# 20 "col2.h"
extern const unsigned short col2Bitmap[19200];
# 17 "main.c" 2



u16 oldButtons;
u16 buttons;
OBJ_ATTR shadowOAM[128];


void goToStart();
void start();
void goToGame1();
void game1();
void goToGame2();
void game2();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void initialize();

enum STATE {START, GAME1, GAME2, PAUSE, WIN, LOSE};
int state;
int clearRound1 = 0;
int clearRound2 = 0;
int currentRound = 1;
int lives;

int main() {
    initialize();

    while(1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        switch (state) {
            case START:
                start();
                break;
            case GAME1:
                game1();
                break;
            case GAME2:
                game2();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
        }
    }
    return 0;
}

void initialize() {
    mgba_open();

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x4000008) = (0 << 14) | ((0) << 2) | ((8) << 8);

    DMANow(3, spritesheetTiles, &((CB*) 0x6000000)[4], 32768 / 2);
    DMANow(3, spritesheetPal, ((u16 *)0x5000200), 512 / 2);

    DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 512 / 2);

    goToStart();
}

void goToStart() {
    DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, backgroundTiles, &((CB*) 0x6000000)[0], 7200 / 2);
    DMANow(3, backgroundMap, &((SB*) 0x6000000)[8], 2048 / 2);
    shadowOAM[40].attr0 = (0<<13) | (1<<14) | ((100) & 0xFF);
    shadowOAM[40].attr1 = (1<<14) | ((150) & 0x1FF);
    shadowOAM[40].attr2 = ((((15) * (32) + (7))) & 0x3FF);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = START;

}

void start() {
    DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, backgroundTiles, &((CB*) 0x6000000)[0], 7200 / 2);
    DMANow(3, backgroundMap, &((SB*) 0x6000000)[8], 2048 / 2);
    if ((!(~(oldButtons) & ((1<<3))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<3))))) {
        goToGame1();
    }
}

void goToGame1() {
    DMANow(3, tmap1Map, &((SB*) 0x6000000)[8], 2048 / 2);
    DMANow(3, tmap1Tiles, &((CB*) 0x6000000)[0], 7200 / 2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    initGame1();
    state = GAME1;

}

void game1() {
    updateGame1();
    drawGame1();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);




    if ((!(~(oldButtons) & ((1<<2))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<2))))) {
        goToPause();
    }
    if (lives == 0) {
        goToLose();
    }
    if (score == 6) {
        goToGame2();
    }
}

void goToGame2() {
    DMANow(3, tilemap2Map, &((SB*) 0x6000000)[8], 2048 / 2);
    DMANow(3, tilemap2Tiles, &((CB*) 0x6000000)[0], 192 / 2);
    initGame2();
    state = GAME2;
    currentRound = 2;
}

void game2() {
    updateGame2();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
    drawGame2();
    if (score == 15) {
        goToWin();
    }




    if (lives == 0) {
        goToLose();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<2))))) {
        goToPause();
    }
}


void goToPause() {
    DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, backgroundTiles, &((CB*) 0x6000000)[0], 7200 / 2);
    DMANow(3, backgroundMap, &((SB*) 0x6000000)[8], 2048 / 2);
    hideSprites();
    shadowOAM[41].attr0 = (0<<13) | (1<<14) | ((100) & 0xFF);
    shadowOAM[41].attr1 = (2<<14) | ((150) & 0x1FF);
    shadowOAM[41].attr2 = ((((15) * (32) + (18))) & 0x3FF);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    state = PAUSE;
}

void pause() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<3))))) {
        if(currentRound == 2) {
            goToGame2();
        } else {
            goToGame1();
        }
    }
}
void goToWin() {
    DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, backgroundTiles, &((CB*) 0x6000000)[0], 7200 / 2);
    DMANow(3, backgroundMap, &((SB*) 0x6000000)[8], 2048 / 2);
    hideSprites();
    shadowOAM[42].attr0 = (0<<13) | (0<<14) | ((100) & 0xFF);
    shadowOAM[42].attr1 = (1<<14) | ((150) & 0x1FF);
    shadowOAM[42].attr2 = ((((15) * (32) + (11))) & 0x3FF);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    state = WIN;
}

void win() {

    if ((!(~(oldButtons) & ((1<<3))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<3))))) {
        goToStart();
    }
}

void goToLose() {
    DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, backgroundTiles, &((CB*) 0x6000000)[0], 7200 / 2);
    DMANow(3, backgroundMap, &((SB*) 0x6000000)[8], 2048 / 2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    shadowOAM[43].attr0 = (0<<13) | (1<<14) | ((100) & 0xFF);
    shadowOAM[43].attr1 = (1<<14) | ((150) & 0x1FF);
    shadowOAM[43].attr2 = ((((15) * (32) + (14))) & 0x3FF);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    state = LOSE;

}

void lose() {
    if ((!(~(oldButtons) & ((1<<2))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<2))))) {
        goToStart();
    }
}
