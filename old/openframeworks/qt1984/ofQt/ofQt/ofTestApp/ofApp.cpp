#include "ui_mainwindow.h"
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    circleRadius = 50;
    XPos = 0;
    YPos = 0;
    rCol = 0;
    bCol = 0;
    gCol = 0;

}

//--------------------------------------------------------------
void ofApp::update(){
    double radiusValue=ui->radiusSlider->value();
    circleRadius = int(radiusValue);

    double xposValue=ui->xposSlider->value();
    XPos = int(xposValue);

    double yposValue=ui->yposSlider->value();
    YPos = int(yposValue);

    double redValue=ui->redSlider->value();
    rCol = int(redValue);

    double blueValue=ui->blueSlider->value();
    bCol = int(blueValue);

    double greenValue=ui->greenSlider->value();
    gCol = int(greenValue);
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofPushStyle();
    ofDrawBitmapString("value from slider: " + ofToString(circleRadius), 20, 20);
    ofPopStyle();
    ofSetColor(rCol, gCol, bCol);
    ofDrawCircle(XPos, YPos, circleRadius*2, circleRadius*2);
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y){

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
