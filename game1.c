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
#include "player.h"

//variables 
RIN enemyRin[RINCOUNT];
OBJ_ATTR shadowOAM[128];
int enemyFrames = 10;
int score = 0;
int lives = 3;

//inits game 1
void initGame1() {
    int x = 40;
    int y = 20;
    int index = 1;
    for (int i = 0; i < RINCOUNT; i++) {
        enemyRin[i].active = 1;
        enemyRin[i].x = x;
        enemyRin[i].y = y;
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
    initPlayer(&player);
    initBubbles(bubbleArray);
}
//checks for bubble collision with rin
void BubbleCollisionWithRin() {
    for (int i = 0; i < BUBBLECOUNT; i++) {
        if (bubbleArray[i].active) {
            for (int j = 0; j < RINCOUNT; j++) {
                if (enemyRin[j].active) {
                    //mgba_printf("bubble colided");
                    if (collision(enemyRin[j].x, enemyRin[j].y, enemyRin[j].width, enemyRin[j].height,
                     bubbleArray[i].x, bubbleArray[i].y, bubbleArray[i].width, bubbleArray[i].height)) {
                        enemyRin[j].trapped = 1;
                        bubbleArray[i].active = 0;
                        //mgba_printf("bubble collided");
                    }
                }
            }
        }
    }
}

//checks for player collision with rin
void playerCollisionRin(PLAYER* player) {
    for(int i = 0; i < RINCOUNT; i++) {
        if (enemyRin[i].active) {
            // mgba_printf("Player X: %d", player->x);
            // mgba_printf("Player Y: %d", player->y);
            // mgba_printf("enemyRin X: %d", enemyRin[i].x);
            // mgba_printf("enemyRin Y: %d", enemyRin[i].y);
            if (collision(player -> x, player -> y, player -> width, player -> height,
             enemyRin[i].x, enemyRin[i].y, enemyRin[i].width, enemyRin[i].height)) {
                mgba_printf("collided");
                if (enemyRin[i].trapped) {
                    mgba_printf("enemy has become food");
                    enemyRin[i].food = 1;
                    enemyRin[i].trapped = 0;
                } else if (enemyRin[i].food) {
                    score++;
                    enemyRin[i].active = 0;
                } else {
                    lives--;
                    player -> x = 120;
                    player -> y = 110;
                }
            }
        }
    }
}

//updates rins location
void updateEnemyRin(PLAYER* player) {
    enemyFrames--;
    if (enemyFrames == 0) {
        for (int i = 0; i < RINCOUNT; i++) {
            enemyRin[i].currentFrame++;
            if ((!(enemyRin[i].food) || !(enemyRin[i].trapped)) && enemyRin[i].active ) { 
                if (player -> y > enemyRin[i].y) {
                    enemyRin[i].y++;
                } else {
                    enemyRin[i].y--;
                }
                if (player -> x > enemyRin[i].x) {
                    enemyRin[i].x++;
                    enemyRin[i].direction = 'r';
                } else {
                    enemyRin[i].x--;
                    enemyRin[i].direction = 'l';
                }
                if (enemyRin[i].currentFrame == 2) {
                    enemyRin[i].currentFrame = 0;
                }
            }
        }
        enemyFrames = 10;
    }
}

//draws lives on screen
void drawLives() {
    int x = 20;
    for (int i = 30; i < lives + 30; i++) {
        shadowOAM[i].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(5);
        shadowOAM[i].attr1 = ATTR1_SMALL | ATTR1_X(x);
        shadowOAM[i].attr2 = ATTR2_TILEID(5,13);
        x += 10;
    }
    if (lives == 2) {
        shadowOAM[32].attr0 = ATTR0_HIDE;
    } else if (lives == 1) {
        shadowOAM[31].attr0 = ATTR0_HIDE;
    }

}

//draws enemy 
void drawEnemyRin() {
    for (int i = 0; i < RINCOUNT; i++) {
        if (enemyRin[i].active) {
            shadowOAM[enemyRin[i].OAMIndex].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(enemyRin[i].y);
            shadowOAM[enemyRin[i].OAMIndex].attr1 = ATTR1_SMALL | ATTR1_X(enemyRin[i].x);
            if (enemyRin[i].currentFrame == 0 && enemyRin[i].direction == 'l') {
                shadowOAM[enemyRin[i].OAMIndex].attr2 = ATTR2_TILEID(6,5);
            } else if (enemyRin[i].currentFrame == 1 && enemyRin[i].direction == 'l') {
                shadowOAM[enemyRin[i].OAMIndex].attr2 = ATTR2_TILEID(8,5);
            } else if (enemyRin[i].currentFrame == 2 && enemyRin[i].direction == 'l') {
                shadowOAM[enemyRin[i].OAMIndex].attr2 = ATTR2_TILEID(10,15);
            } else if (enemyRin[i].currentFrame == 0 && enemyRin[i].direction == 'r') {
                shadowOAM[enemyRin[i].OAMIndex].attr2 = ATTR2_TILEID(14,5);
            } else if (enemyRin[i].currentFrame == 1 && enemyRin[i].direction == 'r') {
                shadowOAM[enemyRin[i].OAMIndex].attr2 = ATTR2_TILEID(16,5);
            } else if (enemyRin[i].currentFrame == 2 && enemyRin[i].direction == 'r') {
                shadowOAM[enemyRin[i].OAMIndex].attr2 = ATTR2_TILEID(18,15);
            }

            if (enemyRin[i].trapped) {
                shadowOAM[enemyRin[i].OAMIndex].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(enemyRin[i].y);
                shadowOAM[enemyRin[i].OAMIndex].attr1 = ATTR1_MEDIUM | ATTR1_X(enemyRin[i].x);
                shadowOAM[enemyRin[i].OAMIndex].attr2 = ATTR2_TILEID(22,3);
            } else if (enemyRin[i].food) {
                shadowOAM[enemyRin[i].OAMIndex].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(enemyRin[i].y + 50);
                shadowOAM[enemyRin[i].OAMIndex].attr1 = ATTR1_TINY | ATTR1_X(enemyRin[i].x);
                shadowOAM[enemyRin[i].OAMIndex].attr2 = ATTR2_TILEID(1,15);
                if (enemyRin[i].currentFrame = 1) {
                    shadowOAM[enemyRin[i].OAMIndex].attr2 = ATTR2_TILEID(3,15);
                } else if (enemyRin[i].currentFrame = 2) {
                    shadowOAM[enemyRin[i].OAMIndex].attr2 = ATTR2_TILEID(5,15);
                }
            }
        } else {
            shadowOAM[enemyRin[i].OAMIndex].attr0 = ATTR0_HIDE;
        }

    }
}
//draws score
void drawScore() {
    //show "score"
        shadowOAM[35].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(2);
        shadowOAM[35].attr1 = ATTR1_MEDIUM | ATTR1_X(150);
        shadowOAM[35].attr2 = ATTR2_TILEID(7,12);
        shadowOAM[36].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(2);
        shadowOAM[36].attr1 = ATTR1_TINY | ATTR1_X(180);
        shadowOAM[36].attr2 = ATTR2_TILEID(11 + score, 12);
}

//update game 1 loop
void updateGame1() {
    updatePlayer(&player);
    updateBubbles(bubbleArray);
    updateEnemyRin(&player);
    playerCollisionRin(&player);
    BubbleCollisionWithRin();
}
//draw game 1 loop
void drawGame1() {
    drawEnemyRin();
    drawPlayer(&player);
    drawBubbles(bubbleArray);
    drawLives();
    drawScore();
}

