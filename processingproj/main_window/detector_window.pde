import gab.opencv.*;
import processing.video.*;

public class detector_window extends PApplet {

  Capture video;
  OpenCV opencv;
  
  public void settings() {
    size(640, 480, P3D);
  }

  void setup() {     
    video = new Capture(this, 640/2, 480/2); 
    opencv = new OpenCV(this, 640/2, 480/2);
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);    //initally detecting face, will add more
    video.start();
  }

  void draw() {
    isHandMovementDetectorWindowCreated = true;    
    surface.setLocation(0,50);
    scale(2);
    opencv.loadImage(video);
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
  }
  void captureEvent(Capture c) {
    c.read();
  }
}
