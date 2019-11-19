#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
//    ofBackground(120);
//    ofSetFrameRate(60);
    
    gui.setup();
    //set up of the gui and parameters
    gui.add(xPos.setup("xPos", 0, 0, 600));
    gui.add(yPos.setup("yPos", 0, 0, 600));
    gui.add(radius.setup("radius", 60, 0,300));
    
    gui.add(red.setup("red", 0, 0, 255));
    gui.add(green.setup("green", 60, 0, 255));
    gui.add(blue.setup("blue", 255, 0, 255));
    gui.add(rotateX.set("xRotate", 0.0,0.0 , 9.0));
    gui.add(rotateY.set("yRotate", 0.0, 0.0, 9.0));
//    gui.add(rotateZ.set("zRotate", 0.0, 0.0, 9.0));
    //speed of rotation
    gui.add(speed.set("speed", 0.01, 0.0, 5.0));
    
    //degrees to rotate object
    rotationX = 0.0;
    rotationY = 0.0;
    rotationZ = 0.0;
    
    

}

//--------------------------------------------------------------
void ofApp::update(){
    //updating the amount of rotations with each change of the parameter
    rotationX = rotationX + rotateX;
    rotationY = rotationY + rotateY;
    rotationZ = rotationZ + rotateZ;
    

}

//--------------------------------------------------------------
void ofApp::draw(){
   // drawing the gui
    gui.draw();
    ofTranslate(ofGetWidth()/2, ofGetHeight()/2);
//    getting the rotation degree of the object
    ofRotateXDeg(rotationX*speed);
    ofRotateYDeg(rotationY*speed);
    ofRotateZDeg(rotationZ*speed);
    //setting color of the object
    ofSetColor(red, green, blue);
//    drawing the object
    ofDrawCircle(xPos, yPos, radius);
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
