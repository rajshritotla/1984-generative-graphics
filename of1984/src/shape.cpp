//
//  shape.cpp
//  of1984
//
//  Created by Melissa Lin on 11/23/19.
//

#include "shape.hpp"


//--------------------------------------------------------------
void shape::setup(){
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
    
    //setup of box2d object
    box2d.init();
    box2d.setGravity(0, 10);

}

//--------------------------------------------------------------
void shape::update(){
    box2d.update();
    
    rotationX = rotationX + rotateX;
    rotationY = rotationY + rotateY;
    rotationZ = rotationZ + rotateZ;
}

//--------------------------------------------------------------
void shape::draw(){
    gui.draw();
        ofTranslate(ofGetWidth()/2, ofGetHeight()/2);
    //    getting the rotation degree of the object
        ofRotateXDeg(rotationX*speed);
        ofRotateYDeg(rotationY*speed);
        ofRotateZDeg(rotationZ*speed);
        //setting color of the object
        ofSetColor(red, green, blue);
    //    drawing the object
//        ofDrawCircle(xPos, yPos, radius);
    
    auto circle = new ofxBox2dCircle();
    circle->setPhysics(0.5, 0.5, 1);
    circle->setup(box2d.getWorld(), xPos, yPos, radius);
//    objects.emplace_back(circle);
    
}

//--------------------------------------------------------------
void shape::keyPressed(int key){

}

//--------------------------------------------------------------
void shape::keyReleased(int key){

}

//--------------------------------------------------------------
void shape::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void shape::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void shape::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void shape::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void shape::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void shape::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void shape::windowResized(int w, int h){

}

//--------------------------------------------------------------
void shape::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void shape::dragEvent(ofDragInfo dragInfo){

}
