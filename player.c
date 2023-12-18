#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "tilemap.h"
#include "tilemap1.h"
#include "spritesheet.h"
#include "PurpleRocks.h"
#include "background.h"
#include "game1.h"
#include "game2.h"
#include "player.h"
#include "collisonMap1.h"
#include "col1.h"
#include "col2.h"

#define TOPBORDER 31
#define BOTTOMBORDER 144
#define LEFTBORDER 39
#define RIGHTBORDER 200


inline unsigned char colorAt(int x, int y) {
    if (score < 6) {
        return ((unsigned char*) col1Bitmap) [OFFSET(x, y, 240)];
    } else {
        mgba_printf("colorat: %d",((unsigned char*) col2Bitmap) [OFFSET(x, y, 240)]);
        return ((unsigned char*) col2Bitmap) [OFFSET(x, y, 240)];
    }
}

//intializes player values
void initPlayer(PLAYER* player) {
    int leftX = player -> x;
    int rightX = player -> x + player -> width - 1;
    int topY = player -> y;
    int bottomY = player -> y + player -> height - 1;
    player -> x = 120;
    player -> y = 110;
    player -> xVel = 1;
    player -> yVel = 2;
    player -> height = 16;
    player -> width = 16;

    player -> direction = 'u';
    player -> isMoving = 0;
    player -> timeUntilNextFrame = 10;
    player -> currentFrame = 1;
    player -> numFrames = 3;
    player -> grounded = colorAt(rightX, bottomY) && colorAt(leftX, bottomY);
    playerState = AIRBORNE;
}

void initBubbles(BUBBLE* bubbleArray) {
    int index = 9;
    for (int i = 0; i < 20; i++) {
        bubbleArray[i].height = 21;
        bubbleArray[i].width = 23;
        bubbleArray[i].yVel = 1;
        bubbleArray[i].active = 0;
        bubbleArray[i].OAMIndex = index;
        index++;
    }
}

void createBubble(PLAYER* player, BUBBLE* bubbleArray) {
    int found = 0;
    for (int i = 0; i < 20; i++) {
        if ((bubbleArray[i].active == 0) && (found == 0)) {
            mgba_printf("bubble created");
            bubbleArray[i].active = 1;
            bubbleArray[i].x = player -> x - 5;

            bubbleArray[i].y = player -> y;
            found = 1;
        }
    }
}

void updateBubbles(BUBBLE* bubbleArray) {
    for (int i = 0; i < BUBBLECOUNT; i++) {
        if (bubbleArray[i].active) {
            mgba_printf("bubble updated");
            bubbleArray[i].y = bubbleArray[i].y - bubbleArray[i].yVel;
            if (bubbleArray[i].y < TOPBORDER) {
                mgba_printf("Bubble off screen");
                bubbleArray[i].active = 0;
            }
        }
    }
}

void drawBubbles(BUBBLE* bubbleArray) {
    for (int i = 0; i < BUBBLECOUNT; i++) {
        if (bubbleArray[i].active) {
            mgba_printf("drawing bubbles");
            shadowOAM[bubbleArray[i].OAMIndex].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(bubbleArray[i].y);
            shadowOAM[bubbleArray[i].OAMIndex].attr1 = ATTR1_MEDIUM | ATTR1_X(bubbleArray[i].x);
            shadowOAM[bubbleArray[i].OAMIndex].attr2 = ATTR2_TILEID(0,11);
        } else {
            shadowOAM[bubbleArray[i].OAMIndex].attr0 = ATTR0_HIDE;
        }
    }
}

//updates player location
void updatePlayer(PLAYER* player) {
    //variables
    int leftX = player -> x;
    int rightX = player -> x + player -> width - 1;
    int topY = player -> y;
    int bottomY = player -> y + player -> height - 1;

    int abovePlayer = (colorAt(rightX, topY + 1) && colorAt(leftX, topY + 1));
    
    //grounded stuff
    if (colorAt(rightX, bottomY + 1) || colorAt(leftX, bottomY + 1)) {
        player -> grounded = 1;
        if (playerState == AIRBORNE) {
            playerState = GROUNDED;
        }
    } else {
        player -> grounded = 0;
        // player -> y += player -> yVel * 1;
        if (playerState != JUMPING) {
            playerState = AIRBORNE;
        }
    }
    //resets ismoving
    player -> isMoving = 0;
    //gravity
    
    
    if(BUTTON_HELD(BUTTON_LEFT)) {
        player -> isMoving = 1;
        if ((player -> x - player -> xVel) > LEFTBORDER) {
            player -> x -= player -> xVel;
            player -> direction = 'l';
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player -> isMoving = 1;
        if ((player -> x + player -> xVel) < RIGHTBORDER) {
            player -> x += player -> xVel;
            player -> direction = 'r';
        }
    }
    if (BUTTON_PRESSED(BUTTON_UP) && player -> grounded) {
        player -> isMoving = 1;
        playerState = JUMPING;
        jumpFrames = 20;
    }

    if (BUTTON_PRESSED(BUTTON_A)) {
        createBubble(player, bubbleArray);
    }

    if (playerState == JUMPING) {
        if ((jumpFrames < 1) || abovePlayer) {
            playerState = AIRBORNE;
            //mgba_printf("Player starting to fall");
        } else {
            jumpFrames -=1 ;
            //mgba_printf("Jumpframes: %d", jumpFrames);
            //mgba_printf("Player y before: %d", player->y);
            player -> y += -1 * player -> yVel;
            //mgba_printf("Player y after: %d", player->y);
            //mgba_printf("Player yVel: %d", player->yVel);
        }
    } else if (playerState == AIRBORNE) {
        player -> y++;
        if (player -> grounded) {
            playerState = GROUNDED;
        }
    }

    //animation
    if (player -> isMoving) {
            player -> timeUntilNextFrame--;
        if (player -> timeUntilNextFrame == 0) {
            player -> currentFrame++;
            if (player -> currentFrame > player -> numFrames) {
                player -> currentFrame = 1;
            }
            player -> timeUntilNextFrame = 10;
        }
    } else {
        player -> currentFrame = 1;
        player -> timeUntilNextFrame = 10;
    }

}

void drawPlayer(PLAYER* player) {
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player -> y);
    shadowOAM[0].attr1 = ATTR1_SMALL | ATTR1_X(player -> x);
    if (player -> isMoving == 0) {
        shadowOAM[0].attr2 = ATTR2_TILEID(0,1);
    } else if (player -> direction == 'l') {
        if (player -> currentFrame == 1) {
            shadowOAM[0].attr2 = ATTR2_TILEID(6,1);
        } else if (player -> currentFrame == 2) {
            shadowOAM[0].attr2 = ATTR2_TILEID(8,1);
        } if (player -> currentFrame == 3) {
            shadowOAM[0].attr2 = ATTR2_TILEID(10,1);
        }
    } else if (player -> direction == 'r') {
        if (player -> currentFrame == 1) {
            shadowOAM[0].attr2 = ATTR2_TILEID(14,1);
        } else if (player -> currentFrame == 2) {
            shadowOAM[0].attr2 = ATTR2_TILEID(16,1);
        } if (player -> currentFrame == 3) {
            shadowOAM[0].attr2 = ATTR2_TILEID(18,1);
        }
    } else if (player -> direction == 'u' && (!player -> grounded)) {
        shadowOAM[0].attr2 = ATTR2_TILEID(3,1);
    }
}
