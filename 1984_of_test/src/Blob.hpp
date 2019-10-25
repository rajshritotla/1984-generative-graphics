//
//  Blob.hpp
//  1984_of_test
//
//  Created by Melissa Lin on 10/25/19.
//

#ifndef Blob_h
#define Blob_h

#include <stdio.h>
#include "ofMain.h"

#define WIDTH 1200
#define HEIGHT 1080

class Blob {
public:
    void setup(float xPos, float yPos);
    void init(float xPos, float yPos, bool isLeft);
    void update();
    ofVec2f getPos(int index);
    void setStart(ofVec2f pos);
    void setEnd(ofVec2f pos);
    void setJitter(float speed, float stepX, float stepY);
    bool isEndOfPath(ofVec2f pos);
    
    ofVec2f start;
    ofVec2f end;
    ofVec2f currPos;
    bool dir; // true: going left, false: going right
    float xseed, yseed;
    int numCircles;
    int state; // 0: idle at start, 1: in motion, 2: interpolating, 3: jittering at end
    float initTime;
    float interpolationStartTime;
    float interpolationFrameInterval;
    float swirlTime;
    float jitterSpeed;
    float moveSpeed;
    float swirlSpeed;
    float indexIncrement;
    float xstep;
    float ystep;
    ofVec2f swirlCenter;
};

#endif /* Blob_hpp */


#endif /* Blob_h */
