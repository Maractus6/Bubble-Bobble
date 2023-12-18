#ifndef GAME2_H
#define GAME2_H

#define SAYORICOUNT 3

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



#endif