//
//  webcam.hpp
//  of1984
//
//  Created by Melissa Lin on 11/23/19.
//

//#ifndef webcam_hpp
//#define webcam_hpp
#pragma once

#include "ofMain.h"
#include "ofxOpenCv.h"

//#include <stdio.h>
//
//#endif /* webcam_hpp */

class webcam
{
public:
    void setup();
    void update();
    void draw();

    void keyPressed(int key);
    void keyReleased(int key);
    void mouseMoved(int x, int y );
    void mouseDragged(int x, int y, int button);
    void mousePressed(int x, int y, int button);
    void mouseReleased(int x, int y, int button);
    void mouseEntered(int x, int y);
    void mouseExited(int x, int y);
    void windowResized(int w, int h);
    void dragEvent(ofDragInfo dragInfo);
    void gotMessage(ofMessage msg);
    
    ofVideoGrabber webcam;
    ofVideoGrabber webcam_feed;
    ofxCvColorImage color_frame;
    ofxCvGrayscaleImage grayscale_frame;
    ofxCvGrayscaleImage background_grayscale;
    ofxCvGrayscaleImage abs_difference;
    ofxCvContourFinder contour_finder;
    
    bool hasBackground = false;
    int threshold_val = 50;
    
    
};
