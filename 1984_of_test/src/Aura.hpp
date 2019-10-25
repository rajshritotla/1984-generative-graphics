//
//  Aura.hpp
//  1984_of_test
//
//  Created by Melissa Lin on 10/25/19.
//

#ifndef Aura_h
#define Aura_h

#include <stdio.h>
#include "ofMain.h"

class Aura {
public:
    void setup(int x_, int y_, float r_, int id_);
    void update();
    void draw();
    ofPoint make_rect_point(float len, int deg, int z = 0);
    
    ofPolyline poly;
    ofPath path;
    ofPath prevpath;
    int id;
    int x;
    int y;
    float radius;
    bool triggered;
    bool glowing;
    bool disappear;
    int triggerTime;
    int triggerColor;
    float noiseZ;
    float noiseXY;
};


#endif /* Aura_h */
