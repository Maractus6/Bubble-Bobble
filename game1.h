#ifndef GAME1_H
#define GAME1_H

#define RINCOUNT 6

#include "player.h"

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



#endif