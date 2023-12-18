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

RIN enemyRin[RINCOUNT];
SAYORI enemySayori[SAYORICOUNT];

int timeUntilMovement = 600;

//inits game 2
void initGame2() {
    int x = 40;
    int y = 20;
    int index = 1;
    lives = 3;
    for (int i = 0; i < RINCOUNT; i++) {
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
    for (int i = 0; i < SAYORICOUNT; i++) {
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

//checks for bubble collision with sayori
void BubbleCollisionWithSayori() {
    for (int i = 0; i < BUBBLECOUNT; i++) {
        if (bubbleArray[i].active) {
            for (int j = 0; j < SAYORICOUNT; j++) {
                if (enemySayori[j].active) {
                    //mgba_printf("bubble colided");
                    if (collision(enemySayori[j].x, enemySayori[j].y, enemySayori[j].width, enemySayori[j].height,
                     bubbleArray[i].x, bubbleArray[i].y, bubbleArray[i].width, bubbleArray[i].height)) {
                        enemySayori[j].trapped = 1;
                        bubbleArray[i].active = 0;
                        //mgba_printf("bubble collided");
                    }
                }
            }
        }
    }
}
//updates location of enemy sayori
void updateEnemySayori(PLAYER* player) {
    enemyFrames--;
    if (enemyFrames == 0) {
        for (int i = 0; i < SAYORICOUNT; i++) {
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
//checks for player collision with sayori
void playerCollisionSayori(PLAYER* player) {
    timeUntilMovement--;
    if (timeUntilMovement == 0) {
          for(int i = 0; i < RINCOUNT; i++) {
        if (enemySayori[i].active) {
            if (collision(player -> x, player -> y, player -> width, player -> height,
             enemySayori[i].x, enemySayori[i].y, enemySayori[i].width, enemySayori[i].height)) {
                //mgba_printf("collided");
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
//draws sayori
void drawEnemySayori() {
    for (int i = 0; i < SAYORICOUNT; i++) {
        if (enemySayori[i].active) {
            shadowOAM[enemySayori[i].OAMIndex].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(enemySayori[i].y);
            shadowOAM[enemySayori[i].OAMIndex].attr1 = ATTR1_SMALL | ATTR1_X(enemySayori[i].x);
            if (enemySayori[i].currentFrame == 0 && enemySayori[i].direction == 'l') {
                shadowOAM[enemySayori[i].OAMIndex].attr2 = ATTR2_TILEID(6,9);
            } else if (enemySayori[i].currentFrame == 1 && enemySayori[i].direction == 'l') {
                shadowOAM[enemySayori[i].OAMIndex].attr2 = ATTR2_TILEID(8,9);
            } else if (enemySayori[i].currentFrame == 0 && enemySayori[i].direction == 'r') {
                shadowOAM[enemySayori[i].OAMIndex].attr2 = ATTR2_TILEID(11,9);
            } else if (enemySayori[i].currentFrame == 2 && enemySayori[i].direction == 'r') {
                shadowOAM[enemySayori[i].OAMIndex].attr2 = ATTR2_TILEID(13,9);
            }
            if (enemySayori[i].trapped) {
                shadowOAM[enemySayori[i].OAMIndex].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(enemySayori[i].y);
                shadowOAM[enemySayori[i].OAMIndex].attr1 = ATTR1_MEDIUM | ATTR1_X(enemySayori[i].x);
                shadowOAM[enemySayori[i].OAMIndex].attr2 = ATTR2_TILEID(22,8);
            } else if (enemySayori[i].food) {
                shadowOAM[enemySayori[i].OAMIndex].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(enemySayori[i].y);
                shadowOAM[enemySayori[i].OAMIndex].attr1 = ATTR1_TINY | ATTR1_X(enemySayori[i].x + 10);
                shadowOAM[enemySayori[i].OAMIndex].attr2 = ATTR2_TILEID(1,15);
                if (enemySayori[i].currentFrame = 1) {
                    shadowOAM[enemySayori[i].OAMIndex].attr2 = ATTR2_TILEID(3,15);
                } else if (enemySayori[i].currentFrame = 2) {
                    shadowOAM[enemySayori[i].OAMIndex].attr2 = ATTR2_TILEID(5,15);
                }
            }
        } else {
            shadowOAM[enemySayori[i].OAMIndex].attr0 = ATTR0_HIDE;
        }

    }
}

//update loop for game 2
void updateGame2() {
    updatePlayer(&player);
    updateBubbles(bubbleArray);
    updateEnemyRin(&player);
    playerCollisionRin(&player);
    playerCollisionSayori(&player);
    BubbleCollisionWithRin(bubbleArray);
    BubbleCollisionWithSayori(bubbleArray);
}

//draw loop for game 2
void drawGame2() {
    drawEnemyRin();
    drawEnemySayori();
    drawPlayer(&player);
    drawBubbles(bubbleArray);
    drawLives();
    drawScore(&player);
}