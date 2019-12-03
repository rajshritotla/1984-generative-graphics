//
//  webcam.cpp
//  of1984
//
//  Created by Melissa Lin on 11/23/19.
//

#include "webcam.hpp"

//--------------------------------------------------------------
void webcam::setup(){
     webcam.setup(640, 480);
    ofSetColor(255,255,255);
    
    color_frame.allocate(webcam_feed.getWidth(), webcam_feed.getHeight());
    grayscale_frame.allocate(webcam_feed.getWidth(), webcam_feed.getHeight());
    background_grayscale.allocate(webcam_feed.getWidth(), webcam_feed.getHeight());
    abs_difference.allocate(webcam_feed.getWidth(), webcam_feed.getHeight());
    

}

//--------------------------------------------------------------
void webcam::update(){
     webcam.update();
    ofSetColor(255,255,255);
    
    webcam_feed.update();
    // Check that there is a new frame to load - reduces amount of work by constant updates
    // If there is a new frame, update color and grayscaled images to continue producing a video
    if (webcam_feed.isFrameNew()){
        // Default set background image for differencing as first available frame
        if (!hasBackground) {
            color_frame.setFromPixels(webcam_feed.getPixels());
            background_grayscale = color_frame;
            hasBackground = !hasBackground;
        }
        
        color_frame.setFromPixels(webcam_feed.getPixels());
        grayscale_frame = color_frame;
        
        // Get absolute difference between two frames to obtain foreground and background
        abs_difference.absDiff(background_grayscale, grayscale_frame);
        abs_difference.threshold(threshold_val);
        abs_difference.dilate();
        abs_difference.dilate();
        
        // Find 1 blob since hand (and even body) should be one whole region
        int min_area = abs_difference.getWidth() * abs_difference.getHeight() * 0.05;
        int max_area = abs_difference.getWidth() * abs_difference.getHeight() * 0.75;
        contour_finder.findContours(abs_difference, min_area, max_area, 1, false);
    }
}

//--------------------------------------------------------------
void webcam::draw(){
    webcam.draw(0, 0, 320, 240);
    ofSetColor(255,255,255);

    
}

//--------------------------------------------------------------
void webcam::keyPressed(int key){

}

//--------------------------------------------------------------
void webcam::keyReleased(int key){

}

//--------------------------------------------------------------
void webcam::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void webcam::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void webcam::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void webcam::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void webcam::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void webcam::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void webcam::windowResized(int w, int h){

}

//--------------------------------------------------------------
void webcam::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void webcam::dragEvent(ofDragInfo dragInfo){

}
