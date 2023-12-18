#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "tilemap.h"
#include "tilemap1.h"
#include "tilemap2.h"
#include "spritesheet.h"
#include "PurpleRocks.h"
#include "background.h"
#include "game1.h"
#include "game2.h"
#include "player.h"
#include "tmap1.h"
#include "col1.h"
#include "col2.h"


//variables
u16 oldButtons;
u16 buttons;
OBJ_ATTR shadowOAM[128];

// state prototypes
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
        buttons = REG_BUTTONS;
        //state machine
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
    //enable stuff
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(8);
    // sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITE_PAL, spritesheetPalLen / 2);
    //background
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen / 2);

    goToStart();
}

void goToStart() {
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen / 2);
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    DMANow(3, backgroundMap, &SCREENBLOCK[8], backgroundMapLen / 2);
    shadowOAM[40].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(100);
    shadowOAM[40].attr1 = ATTR1_SMALL | ATTR1_X(150);
    shadowOAM[40].attr2 = ATTR2_TILEID(7,15);
    DMANow(3, shadowOAM, OAM, 512);

    state = START;
    
}

void start() {
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen / 2);
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    DMANow(3, backgroundMap, &SCREENBLOCK[8], backgroundMapLen / 2);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame1();
    }
}

void goToGame1() {
    DMANow(3, tmap1Map, &SCREENBLOCK[8], tmap1MapLen / 2);
    DMANow(3, tmap1Tiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    initGame1();
    state = GAME1;

}

void game1() {
    updateGame1();
    drawGame1();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
    // if (BUTTON_PRESSED(BUTTON_B)) {
    //     DMANow(3, col1Bitmap, videoBuffer, col1BitmapLen / 2);
    //     REG_DISPCTL = MODE(4) | BG_ENABLE(2) | SPRITE_ENABLE;
    // }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
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
    DMANow(3, tilemap2Map, &SCREENBLOCK[8], tilemap2MapLen / 2);
    DMANow(3, tilemap2Tiles, &CHARBLOCK[0], tilemap2TilesLen / 2);
    initGame2();
    state = GAME2;
    currentRound = 2;
}

void game2() {
    updateGame2();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
    drawGame2();
    if (score == 15) {
        goToWin();
    }
    // if (BUTTON_PRESSED(BUTTON_B)) {
    //     DMANow(3, col2Bitmap, videoBuffer, col2BitmapLen / 2);
    //     REG_DISPCTL = MODE(4) | BG_ENABLE(2) | SPRITE_ENABLE;
    // }
    if (lives == 0) {
        goToLose();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
}


void goToPause() {
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen / 2);
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    DMANow(3, backgroundMap, &SCREENBLOCK[8], backgroundMapLen / 2);
    hideSprites();
    shadowOAM[41].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(100);
    shadowOAM[41].attr1 = ATTR1_MEDIUM | ATTR1_X(150);
    shadowOAM[41].attr2 = ATTR2_TILEID(18,15);
    DMANow(3, shadowOAM, OAM, 512);
    state = PAUSE;
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        if(currentRound == 2) {
            goToGame2();
        } else {
            goToGame1();
        }
    }
}
void goToWin() {
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen / 2);
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    DMANow(3, backgroundMap, &SCREENBLOCK[8], backgroundMapLen / 2);
    hideSprites();
    shadowOAM[42].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(100);
    shadowOAM[42].attr1 = ATTR1_SMALL | ATTR1_X(150);
    shadowOAM[42].attr2 = ATTR2_TILEID(11,15);
    DMANow(3, shadowOAM, OAM, 512);
    state = WIN;
}

void win() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen / 2);
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    DMANow(3, backgroundMap, &SCREENBLOCK[8], backgroundMapLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    shadowOAM[43].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(100);
    shadowOAM[43].attr1 = ATTR1_SMALL | ATTR1_X(150);
    shadowOAM[43].attr2 = ATTR2_TILEID(14,15);
    DMANow(3, shadowOAM, OAM, 512);
    state = LOSE;

}

void lose() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

