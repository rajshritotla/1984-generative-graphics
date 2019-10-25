//
//  Aura.cpp
//  1984_of_test
//
//  Created by Melissa Lin on 10/25/19.
//

#include "Aura.hpp"
void Aura::setup(int x_, int y_, float r_, int id_) {
    x = x_;
    y = y_;
    radius = r_;
    id = id_;
    triggered = false;
    glowing = false;
    disappear = false;
    triggerTime = -1;
    triggerColor = 0;
}

void Aura::update() {
    if(triggered) {
        if(triggerTime == -1) {
            triggerTime = ofGetFrameNum();
            triggerColor = 255;
        } else if (ofGetFrameNum() < triggerTime + 50) {
            if(triggerColor-3 > 0) triggerColor -= 3;
            else triggerColor = 0;
        } else if (ofGetFrameNum() >= triggerTime + 50 ) {
            triggered = false;
            triggerTime = -1;
            triggerColor = 0;
        }
    }
    
    if(glowing) {
        triggerColor = 255;
        if(disappear || triggered) glowing = false;
    }
    
    noiseZ = triggered || glowing ? 0.1 : 0.005;
    noiseXY = triggered || glowing ? 0.005 : 0.003;
    
    path.clear();
    for (int deg = 0; deg < 360; deg += 5) {
        ofPoint noise_point = ofPoint(radius * cos(deg * DEG_TO_RAD) + x, radius * sin(deg * DEG_TO_RAD) + y);
        float noise_value = ofMap(ofNoise(noise_point.x * noiseXY, noise_point.y * noiseXY, ofGetFrameNum() * noiseZ + id), 0, 1, 0.5, 1.0); // default: 0.005, noise gaps decreases (controlled by z)
        ofPoint circle_point = ofPoint(radius * noise_value * cos(deg * DEG_TO_RAD), radius * noise_value * sin(deg * DEG_TO_RAD));
        if(deg == 0) {
            path.newSubPath();
            path.moveTo(circle_point);
        } else {
            path.lineTo(circle_point);
        }
    }
    path.close();
}

void Aura::draw() {
    ofPushMatrix();
    ofTranslate(x, y);
    if(triggered || glowing) {
        path.setFilled(true);
        path.setFillColor(ofColor(triggerColor));
    }
    else {
        path.setFilled(false);
    }
    
    if(disappear) path.setStrokeColor(ofColor(triggerColor));
    else path.setStrokeColor(ofColor(255));
    path.setStrokeWidth(2);
    path.draw();
    ofPopMatrix();
}

ofPoint Aura::make_rect_point(float len, int deg, int z) {
    
    int half_len = len * 0.5;
    int param = (deg + 45) / 90;
    
    ofPoint point;
    
    switch (param % 4) {
            
        case 0:
            
            return ofPoint(half_len, ofMap((deg + 45) % 90, 0, 89, -half_len, half_len), z);
        case 1:
            
            return  ofPoint(ofMap((deg + 45) % 90, 0, 89, half_len, -half_len), half_len, z);
        case 2:
            
            return ofPoint(-half_len, ofMap((deg + 45) % 90, 0, 89, half_len, -half_len), z);
        case 3:
            
            return ofPoint(ofMap((deg + 45) % 90, 0, 89, -half_len, half_len), -half_len, z);
        default:
            
            return ofPoint(0, 0, 0);
    }
}
