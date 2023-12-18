#ifndef PLAYER_H
#define PLAYER_H

#define BUBBLECOUNT 20



// structs
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
BUBBLE bubbleArray[BUBBLECOUNT];
extern int score;

enum {GROUNDED = 0, AIRBORNE = 1, JUMPING = 2};
int playerState;
int jumpFrames;


void initPlayer(PLAYER* player);
void drawPlayer(PLAYER* player);
void updatePlayer(PLAYER* player);
void createBubble(PLAYER* player, BUBBLE bubbleArray[BUBBLECOUNT]);
void updateBubbles(BUBBLE bubbleArray[BUBBLECOUNT]);
void initBubbles(BUBBLE bubbleArray[BUBBLECOUNT]);
void drawBubbles(BUBBLE bubbleArray[BUBBLECOUNT]);



#endif