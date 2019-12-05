//camera window
//source code comes from https://github.com/atduskgreg/opencv-processing/blob/master/examples/LiveCamTest/LiveCamTest.pde

import gab.opencv.*;
import processing.video.*;

public class detector_window extends PApplet {

  Capture video; //camera object
  OpenCV opencv; //openCV object
  
  public void settings() {
    //dimensions of the window
    size(640, 480,P3D);
  }

  void setup() {     
    video = new Capture(this, 640/2, 480/2); 
    opencv = new OpenCV(this, 640/2, 480/2);
    opencv.loadCascade(detect);    //loading the cascade xml depending on which body part we want to detect
    video.start();
  }

  void draw() {
    isHandMovementDetectorWindowCreated = true;    
    surface.setLocation(0,50);
    scale(2);
    opencv.loadImage(video); //integrating opencv with the video
    image(video, 0, 0 );
    noFill();
    stroke(0, 255, 0);
    strokeWeight(3);
    Rectangle[] faces = opencv.detect(); //rectangle to detect faces
    for (int i = 0; i < faces.length; i++) {
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height); //laying rectangles on to faces
      xPos = faces[i].x; //changing x coordinates of ellipses
      yPos = faces[i].x; //changing y coordinates of ellipses
    }
    /*
    if (!closeCam)
    {
      video.stop();
    }*/
  }
  void captureEvent(Capture c) {
    c.read();
  }
  
}
