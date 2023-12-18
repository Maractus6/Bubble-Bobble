# 1 "game2.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game2.c"
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
# 2 "game2.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "game2.c" 2
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
# 4 "game2.c" 2
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
# 5 "game2.c" 2
# 1 "tilemap.h" 1







extern const unsigned short tilemapMap[1024];
# 6 "game2.c" 2
# 1 "tilemap1.h" 1
# 21 "tilemap1.h"
extern const unsigned short tilemap1Tiles[64];


extern const unsigned short tilemap1Map[1024];
# 7 "game2.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 8 "game2.c" 2
# 1 "PurpleRocks.h" 1
# 21 "PurpleRocks.h"
extern const unsigned short PurpleRocksTiles[16384];


extern const unsigned short PurpleRocksPal[256];
# 9 "game2.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[3600];


extern const unsigned short backgroundMap[1024];


extern const unsigned short backgroundPal[256];
# 10 "game2.c" 2
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
# 11 "game2.c" 2
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
# 12 "game2.c" 2


RIN enemyRin[6];
SAYORI enemySayori[3];

int timeUntilMovement = 600;


void initGame2() {
    int x = 40;
    int y = 20;
    int index = 1;
    lives = 3;
    for (int i = 0; i < 6; i++) {
        enemyRin[i].active = 1;
        enemyRin[i].x = x;
        enemyRin[i].y = 20;
        enemyRin[i].trapped = 0;
        enemyRin[i].food = 0;
        enemyRin[i].width = 16;
        enemyRin[i].height = 16;
        enemyRin[i].OAMIndex = index;
        enemyRin[i].currentFrame = 0;
        enemyRin[i].timeUntilNextFrame = 10;
        enemyRin[i].numFrames = 2;
        enemyRin[i].foodanimating = 0;

        enemyRin[i].direction = 'l';
        x += 30;
        index++;
    }
    for (int i = 0; i < 3; i++) {
        enemySayori[i].active = 1;
        enemySayori[i].x = 140;
        enemySayori[i].y = y;
        enemySayori[i].trapped = 0;
        enemySayori[i].food = 0;
        enemySayori[i].width = 16;
        enemySayori[i].height = 16;
        enemySayori[i].OAMIndex = index;
        enemySayori[i].currentFrame = 0;
        enemySayori[i].timeUntilNextFrame = 10;
        enemySayori[i].numFrames = 2;
        enemySayori[i].foodanimating = 0;
        enemySayori[i].direction = 'l';
        x += 30;
        y+= 30;
        index++;
    }
    initPlayer(&player);
    initBubbles(bubbleArray);
}


void BubbleCollisionWithSayori() {
    for (int i = 0; i < 20; i++) {
        if (bubbleArray[i].active) {
            for (int j = 0; j < 3; j++) {
                if (enemySayori[j].active) {

                    if (collision(enemySayori[j].x, enemySayori[j].y, enemySayori[j].width, enemySayori[j].height,
                     bubbleArray[i].x, bubbleArray[i].y, bubbleArray[i].width, bubbleArray[i].height)) {
                        enemySayori[j].trapped = 1;
                        bubbleArray[i].active = 0;

                    }
                }
            }
        }
    }
}

void updateEnemySayori(PLAYER* player) {
    enemyFrames--;
    if (enemyFrames == 0) {
        for (int i = 0; i < 3; i++) {
            enemySayori[i].currentFrame++;
            if ((!(enemySayori[i].food) || !(enemySayori[i].trapped)) && enemySayori[i].active ) {
                if (player -> y > enemyRin[i].y) {
                    enemySayori[i].y++;
                } else {
                    enemySayori[i].y--;
                }
                if (player -> x > enemyRin[i].x) {
                    enemySayori[i].x++;
                    enemySayori[i].direction = 'r';
                } else {
                    enemySayori[i].x--;
                    enemySayori[i].direction = 'l';
                }
                if (enemySayori[i].currentFrame == 2) {
                    enemySayori[i].currentFrame = 0;
                }
            }
        }
        enemyFrames = 10;
    }
}

void playerCollisionSayori(PLAYER* player) {
    timeUntilMovement--;
    if (timeUntilMovement == 0) {
          for(int i = 0; i < 6; i++) {
        if (enemySayori[i].active) {
            if (collision(player -> x, player -> y, player -> width, player -> height,
             enemySayori[i].x, enemySayori[i].y, enemySayori[i].width, enemySayori[i].height)) {

                if (enemySayori[i].food) {
                    player -> score++;
                    enemySayori[i].active = 0;
                }else if (enemySayori[i].trapped && (timeUntilMovement == 0)) {
                    mgba_printf("enemy has become food");
                    enemySayori[i].food = 1;
                    enemySayori[i].trapped = 0;
                } else {
                    lives--;
                    player -> x = 120;
                    player -> y = 110;
                }
            }
        }
    }
    }
}

void drawEnemySayori() {
    for (int i = 0; i < 3; i++) {
        if (enemySayori[i].active) {
            shadowOAM[enemySayori[i].OAMIndex].attr0 = (0<<13) | (0<<14) | ((enemySayori[i].y) & 0xFF);
            shadowOAM[enemySayori[i].OAMIndex].attr1 = (1<<14) | ((enemySayori[i].x) & 0x1FF);
            if (enemySayori[i].currentFrame == 0 && enemySayori[i].direction == 'l') {
                shadowOAM[enemySayori[i].OAMIndex].attr2 = ((((9) * (32) + (6))) & 0x3FF);
            } else if (enemySayori[i].currentFrame == 1 && enemySayori[i].direction == 'l') {
                shadowOAM[enemySayori[i].OAMIndex].attr2 = ((((9) * (32) + (8))) & 0x3FF);
            } else if (enemySayori[i].currentFrame == 0 && enemySayori[i].direction == 'r') {
                shadowOAM[enemySayori[i].OAMIndex].attr2 = ((((9) * (32) + (11))) & 0x3FF);
            } else if (enemySayori[i].currentFrame == 2 && enemySayori[i].direction == 'r') {
                shadowOAM[enemySayori[i].OAMIndex].attr2 = ((((9) * (32) + (13))) & 0x3FF);
            }
            if (enemySayori[i].trapped) {
                shadowOAM[enemySayori[i].OAMIndex].attr0 = (0<<13) | (0<<14) | ((enemySayori[i].y) & 0xFF);
                shadowOAM[enemySayori[i].OAMIndex].attr1 = (2<<14) | ((enemySayori[i].x) & 0x1FF);
                shadowOAM[enemySayori[i].OAMIndex].attr2 = ((((8) * (32) + (22))) & 0x3FF);
            } else if (enemySayori[i].food) {
                shadowOAM[enemySayori[i].OAMIndex].attr0 = (0<<13) | (0<<14) | ((enemySayori[i].y) & 0xFF);
                shadowOAM[enemySayori[i].OAMIndex].attr1 = (0<<14) | ((enemySayori[i].x + 10) & 0x1FF);
                shadowOAM[enemySayori[i].OAMIndex].attr2 = ((((15) * (32) + (1))) & 0x3FF);
                if (enemySayori[i].currentFrame = 1) {
                    shadowOAM[enemySayori[i].OAMIndex].attr2 = ((((15) * (32) + (3))) & 0x3FF);
                } else if (enemySayori[i].currentFrame = 2) {
                    shadowOAM[enemySayori[i].OAMIndex].attr2 = ((((15) * (32) + (5))) & 0x3FF);
                }
            }
        } else {
            shadowOAM[enemySayori[i].OAMIndex].attr0 = (2<<8);
        }

    }
}


void updateGame2() {
    updatePlayer(&player);
    updateBubbles(bubbleArray);
    updateEnemyRin(&player);
    playerCollisionRin(&player);
    playerCollisionSayori(&player);
    BubbleCollisionWithRin(bubbleArray);
    BubbleCollisionWithSayori(bubbleArray);
}


void drawGame2() {
    drawEnemyRin();
    drawEnemySayori();
    drawPlayer(&player);
    drawBubbles(bubbleArray);
    drawLives();
    drawScore(&player);
}
