#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
    
    ofSetFrameRate(60);
    ofSetWindowPosition(-1560, 0);
    ofSetWindowTitle("openframeworks");
    ofEnableBlendMode(ofBlendMode::OF_BLENDMODE_ADD);
    
    // actors config
    actors[0] = ofPoint(120, 920, 0);
    actors[1] = ofPoint(200, 680, 0);
    actors[2] = ofPoint(450, 700, 0);
    actors[3] = ofPoint(620, 900, 0);
    actors[4] = ofPoint(850, 680, 0);
    actors[5] = ofPoint(1050, 880, 0);
    actors[6] = actors[5];
    for(int i = 0; i < numAuras; i++) {
        auras[i].setup(actors[i].x, actors[i].y, 140, i);
    }
    
    // shader config
    number_of_targets = 56;
    num_of_circles_per_target = 8;
    for (int i = 0; i < number_of_targets; i++) {
        this->targets.push_back(glm::vec2());
    }
    
    // blob class config
    msgIter = 0;
    for (int i = 0; i < number_of_targets/num_of_circles_per_target; i++) {
        Blob b;
        b.setup(actors[i].x, actors[i].y);
        b.numCircles = num_of_circles_per_target;
        msgBlobs.push_back(b);
    }
    this->shader.load("shader/shader.vert", "shader/shader.frag");
    
    // background vid config
    vid.load("text.mov");
    vid.play();
    vidTexture.allocate(WIDTH, HEIGHT/2, GL_LUMINANCE);
}
//--------------------------------------------------------------
void ofApp::update() {
    
    vid.update();
    vidTexture = vid.getTexture();
    
    // aura update
    for(int i = 0; i < numAuras; i++) {
        auras[i].update();
    }
    
    // msg blobs update
    for(int i = 0; i < msgBlobs.size(); i++) {
        Blob b = msgBlobs[i];
        msgBlobs[i].update();
        for(int j = 0; j < num_of_circles_per_target; j++) {
            int x, y;
            ofVec2f pos = msgBlobs[i].getPos(j);
            x = int(pos.x);
            y = int(pos.y);
            this->targets[i*num_of_circles_per_target+j] = glm::vec2(x, y);
        }
    }
}

//--------------------------------------------------------------
void ofApp::draw() {
    // draw msg blobs for regular shader
    this->shader.begin();
    this->shader.setUniform1f("time", ofGetElapsedTimef());
    this->shader.setUniform2f("resolution", WIDTH, HEIGHT);
    this->shader.setUniformTexture("tex0", vidTexture, 1);
    this->shader.setUniform2fv("targets", &this->targets[0].x, this->number_of_targets);
    ofBackground(0);
    ofDrawRectangle(0, 0, WIDTH, HEIGHT);
    vid.draw(0, 0, WIDTH, HEIGHT/2);
    this->shader.end();
    
    // draw auras
    for(int i = 0; i < numAuras; i++) {
        auras[i].draw();
    }

//    ofDrawBitmapString(ofToString((int)ofGetFrameRate()), WIDTH-20, 20);
}

void ofApp::mousePressed(int x, int y, int button) {
    // control playback of video
    if(vid.isPlaying()) vid.stop();
    else vid.play();
}

void ofApp::keyPressed(int key) {
    
    if(key == '0') {
        msgBlobs[0].init(actors[0].x > WIDTH/2 ? abs(actors[0].x - WIDTH) : actors[0].x, actors[0].y, actors[0].x > WIDTH/2 ? true : false);
        auras[0].triggered = true;
        
    } else if (key == '1') {
        msgBlobs[1].init(actors[1].x > WIDTH/2 ? abs(actors[1].x - WIDTH) : actors[1].x, actors[1].y, actors[1].x > WIDTH/2 ? true : false);
        auras[1].triggered = true;
        
    } else if (key == '2') {
        msgBlobs[2].init(actors[2].x > WIDTH/2 ? abs(actors[2].x - WIDTH) : actors[2].x, actors[2].y, actors[2].x > WIDTH/2 ? true : false);
        auras[2].triggered = true;
        
    } else if (key == '3') {
        msgBlobs[3].init(actors[3].x > WIDTH/2 ? abs(actors[3].x - WIDTH) : actors[3].x, actors[3].y, actors[3].x > WIDTH/2 ? true : false);
        auras[3].triggered = true;
        
    } else if (key == '4') {
        msgBlobs[4].init(actors[4].x > WIDTH/2 ? abs(actors[4].x - WIDTH) : actors[4].x, actors[4].y, actors[4].x > WIDTH/2 ? true : false);
        auras[4].triggered = true;
        
    } else if (key == '5') {
        msgBlobs[5].init(actors[5].x > WIDTH/2 ? abs(actors[5].x - WIDTH) : actors[5].x, actors[5].y, actors[5].x > WIDTH/2 ? true : false);
        auras[5].triggered = true;
        
    } else if (key == '6') {
        msgBlobs[6].init(actors[6].x > WIDTH/2 ? abs(actors[6].x - WIDTH) : actors[6].x, actors[6].y, actors[6].x > WIDTH/2 ? true : false);
        auras[5].triggered = true;
        
    } else if (key == 'e') {
        // end of work scene 1: all blobs go to obrien
        for(int i = 0; i < number_of_targets/num_of_circles_per_target; i++) {
            msgBlobs[i].init(actors[i].x > WIDTH/2 ? abs(actors[i].x - WIDTH) : actors[i].x, actors[i].y, false);
            msgBlobs[i].setEnd(ofVec2f(1100, ofRandom(HEIGHT/5 - 50, HEIGHT/5 + 50)));
            msgBlobs[i].setJitter(0.01, 20, 20);
            if(i != 6) {
                auras[i].triggered = true;
                auras[i].disappear = true;
            }
        }
        
    } else if (key == OF_KEY_RETURN) {
        // goes to frame with news article
        vid.setPosition(0.32);
        vid.play();
        
    } else if (key == OF_KEY_LEFT) {
        auras[0].glowing = true;
        auras[1].glowing = true;
        auras[2].glowing = true;
        
    } else if (key == OF_KEY_DOWN) {
        auras[3].glowing = true;
        
    } else if (key == OF_KEY_UP) {
        auras[4].glowing = true;
        
    } else if (key == OF_KEY_RIGHT) {
        auras[5].glowing = true;
        
    } else if(key == 'r') {
        // reset
        msgIter = 0;
        for(int i = 0; i < msgBlobs.size(); i++) {
            msgBlobs[i].setup(actors[i].x, actors[i].y);
        }
        for(int i = 0; i < numAuras; i++) {
            auras[i].setup(actors[i].x, actors[i].y, 140, i);
        }
        
    } else if (key == 't') {
        // full screen
        ofToggleFullscreen();
        
    } else if (key == 's') {
        swirlOn = true;
        for(int i = 0; i < msgBlobs.size(); i++) {
            msgBlobs[i].state = 4;
            msgBlobs[i].setEnd(ofVec2f(ofMap(i, 0, msgBlobs.size(), -100, WIDTH+100), i < 3 ? ofMap(i, 0, 2, HEIGHT/3, -100) : ofMap(i, 3, 6, -100, HEIGHT/3)));
            msgBlobs[i].setJitter(0.05, 50, 30);
        }

    } else if (key == 'w') {
        swirlOn = true;
        for(int i = 0; i < msgBlobs.size(); i++) {
            msgBlobs[i].state = 4;
            msgBlobs[i].swirlCenter = ofVec2f(ofRandom(1000, WIDTH), HEIGHT/5);
            msgBlobs[i].setEnd(ofVec2f(ofMap(i, 0, msgBlobs.size(), -100, WIDTH+100), ofMap(i, 0, msgBlobs.size(), HEIGHT/3, -100)));
            msgBlobs[i].setJitter(0.05, 50, 30);
        }
    } else {
        // add and init blob
//        if(msgIter < number_of_targets/num_of_circles_per_target) {
//            float dir = actors[msgIter].x > WIDTH/2 ? true : false;
//            float xpos = actors[msgIter].x > WIDTH/2 ? abs(actors[msgIter].x - WIDTH) : actors[msgIter].x;
//            msgBlobs[msgIter].init(xpos, actors[msgIter].y, dir);
//            auras[msgIter].triggered = true;
//            printf("end: (%f, %f)\n", msgBlobs[msgIter].end.x, msgBlobs[msgIter].end.y);
//            msgIter++;
//        } else {
//            msgIter = 0;
//        }
        
    }
}
