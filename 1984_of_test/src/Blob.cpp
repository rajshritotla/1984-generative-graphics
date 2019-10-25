//
//  Blob.cpp
//  1984_of_test
//
//  Created by Melissa Lin on 10/25/19.
//

#include "Blob.hpp"

void Blob::setup(float xPos, float yPos) {
    start.x = xPos;
    start.y = yPos;
    currPos = start;
    end.x = WIDTH;
    end.y = 0;
    state = 0;
    interpolationFrameInterval = 60.0;
    moveSpeed = 0.0;
    swirlTime = -1;
    swirlSpeed = 6;
    swirlCenter = ofVec2f(WIDTH/2, HEIGHT/6);
}

void Blob::init(float xPos, float yPos, bool isLeft) {
    dir = isLeft;
    state = 1;
    initTime = ofGetFrameNum();
    swirlTime = -1;
    start.x = xPos;
    start.y = yPos;
    end.x = ofRandom(xPos+100, WIDTH-100);
    end.y = ofRandom(100, HEIGHT/4);
    currPos = start;
    jitterSpeed = ofMap(ofGetFrameRate(), 0, 60, 0.1, 0.05);
    xstep = 100.0;
    ystep = 30.0;
    xseed = ofRandom(100);
    yseed = ofRandom(100);
    swirlCenter = ofVec2f(WIDTH/2, HEIGHT/6);
}

void Blob::update() {
    if(state == 1 || state == 2) {
//        moveSpeed = ofMap(ofGetFrameRate(), 0, 60, 80, 30);
        moveSpeed = 30;
        indexIncrement = 0.8;
    }
    if(state == 1 && isEndOfPath(getPos(0))) {
        state = 2;
        interpolationStartTime = ofGetFrameNum();
    } else if( state == 2 && ofGetFrameNum() > (interpolationStartTime + interpolationFrameInterval) ) {
        state = 3;
    } else if( state == 4 ) {
        if(swirlTime == -1) swirlTime = ofGetFrameNum();
        else if(ofGetFrameNum() > swirlTime + 20) state = 5;
    } else if( state == 5 ){
        start = swirlCenter;
    } else if (state == 5 && isEndOfPath(getPos(0))) {
        state = 0;
    }
}

ofVec2f Blob::getPos(int index) {
    ofVec2f pos;
    if(state == 0) {
        pos = ofVec2f(-100, -100);
    } else if (state == 1) {
        float time = start.x + moveSpeed*(ofGetFrameNum() - initTime - index * indexIncrement);
        float b = pow(end.y / start.y, 1.0/(end.x - start.x));
        float a = end.y / pow(b, end.x);
        pos.x = time;
        pos.y = a * pow(b, time);
        if(dir) pos.x = WIDTH - time;
    } else if (state == 2) {
        float time = start.x + moveSpeed*(ofGetFrameNum() - initTime - index * indexIncrement);
        float b = pow(end.y / start.y, 1.0/(end.x - start.x));
        float a = end.y / pow(b, end.x);
        pos.x = time;
        pos.y = a * pow(b, time);
        if(dir) pos.x = WIDTH - time;
        if(isEndOfPath(pos)) {
            if(!dir) {
                pos.x = ofMap(ofNoise(xseed, jitterSpeed*(ofGetFrameNum() - index*1)), 0, 1, end.x - xstep, end.x + xstep);
                pos.y = ofMap(ofNoise(yseed, jitterSpeed*(ofGetFrameNum() - index*1)), 0, 1, end.y - ystep, end.y + ystep);
            } else {
                pos.x = ofMap(ofNoise(xseed, jitterSpeed*(ofGetFrameNum() - index*1)), 0, 1, WIDTH - end.x - xstep, WIDTH - end.x + xstep);
                pos.y = ofMap(ofNoise(yseed, jitterSpeed*(ofGetFrameNum() - index*1)), 0, 1, end.y - ystep, end.y + ystep);
            }
        }
    } else if (state == 3) {
        // change 0.05 or multiples of index to adjust jittering
        // REPLACE ofGetFrameNum with a ramp
        if(!dir) {
            pos.x = ofMap(ofNoise(xseed, jitterSpeed*(ofGetFrameNum() - index*1)), 0, 1, end.x - xstep, end.x + xstep);
            pos.y = ofMap(ofNoise(yseed, jitterSpeed*(ofGetFrameNum() - index*1)), 0, 1, end.y - ystep, end.y + ystep);
        } else {
            pos.x = ofMap(ofNoise(xseed, jitterSpeed*(ofGetFrameNum() - index*1)), 0, 1, WIDTH - end.x - xstep, WIDTH - end.x + xstep);
            pos.y = ofMap(ofNoise(yseed, jitterSpeed*(ofGetFrameNum() - index*1)), 0, 1, end.y - ystep, end.y + ystep);
        }
    } else if (state == 4) {
        // swirl
        float time = start.x + swirlSpeed*(ofGetFrameNum() - swirlTime - index * indexIncrement * 0.001);
        float x = (WIDTH/2*0.9-(ofGetFrameNum() - swirlTime)*25) > 0 ? (WIDTH/2*0.9-(ofGetFrameNum() - swirlTime)*25) * cos(time) + swirlCenter.x : swirlCenter.x;
        float y = (HEIGHT/6*0.9-(ofGetFrameNum() - swirlTime)*25) > 0 ? (HEIGHT/6*0.9-(ofGetFrameNum() - swirlTime)*25) * sin(time) + swirlCenter.y : swirlCenter.y;
        pos.x = x + ofMap(ofNoise(xseed, jitterSpeed*(ofGetFrameNum() - index*1)), 0, 1, -xstep, xstep);
        pos.y = y + ofMap(ofNoise(yseed, jitterSpeed*(ofGetFrameNum() - index*1)), 0, 1, -ystep, ystep);
    } else if (state == 5) {
        // scatter
        float time = (ofGetFrameNum() - swirlTime - 20 - index * indexIncrement * 0.1) * 0.05f;
        pos.x = start.x * (1.0 - time) + end.x * time + 2 * ofMap(ofNoise(xseed, jitterSpeed*(ofGetFrameNum() - index*1)), 0, 1, -xstep, xstep);
        pos.y = start.y * (1.0 - time) + end.y * time + 2 * ofMap(ofNoise(yseed, jitterSpeed*(ofGetFrameNum() - index*1)), 0, 1, -ystep, ystep);
    }
    return pos;
}

void Blob::setStart(ofVec2f pos) {
    start = pos;
}

void Blob::setEnd(ofVec2f pos) {
    end = pos;
}

void Blob::setJitter(float speed, float stepX, float stepY) {
    jitterSpeed = speed;
    xstep = stepX;
    ystep = stepY;
}

bool Blob::isEndOfPath(ofVec2f pos) {
    // up or down, left or right
    bool isEnd = false;
    bool isUp = false;
    bool isLeft = dir;
    if(start.y > end.y) {
        isUp = true;
    }
    if((isLeft && isUp && pos.x < end.x && pos.y < end.y)  ||
       (isLeft && !isUp && pos.x < end.x && pos.y > end.y) ||
       (!isLeft && isUp && pos.x > end.x && pos.y < end.y) ||
       (!isLeft && !isUp && pos.x > end.x && pos.y > end.y)
       )
    {
        isEnd = true;
    }
    return isEnd;
}
