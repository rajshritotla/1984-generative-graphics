    #pragma once

#include "ofMain.h"
#include "ofxGui.h"

class ofApp : public ofBaseApp{

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
    
    //setting up the gui
    ofxPanel gui;
    
    //setting the positions of the object
    ofxIntSlider xPos;
    ofxIntSlider yPos;
    ofxIntSlider zPos;
    ofxIntSlider radius;
    
    //setting the colors of the object
    ofxIntSlider red;
    ofxIntSlider green;
    ofxIntSlider blue;
    
    //setting the rotation of the object
    ofParameter<float> rotateX;
    ofParameter<float> rotateY;
    ofParameter<float> rotateZ;
    ofParameter<float> speed;
    
    float rotationX;
    float rotationY;
    float rotationZ;

		
};
