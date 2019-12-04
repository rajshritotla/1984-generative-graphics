import processing.video.*;
import java.awt.*;

Capture cam;

Camera camera;

void setup() {
  //fullScreen(P3D);
  size(1280,720,P3D);
  camera = new Camera();
  int selectCamera = 0;  // >>>>when multiple camera exits which camera to choose<<<<
  cam = new Capture(this, width, height, camera.cameras[selectCamera]);
  camera.startCamera();
}

void draw() {
  camera.runCamera();
}

class Camera {  

  //Capture cam;
  String[] cameras;
  Camera() {
    cameras = Capture.list();
    checkCameraAvailablity();
  }
  
  void startCamera(){
    cam.start();
  }

  void runCamera() {
    if (cam.available() == true) {
      cam.read();
    }
    image(cam, 0, 0);
  }
    
  String[] checkCameraAvailablity() {
    if (cameras.length == 0) {
      println("There are no cameras available for capture.");
      exit();
    } else {
      println("Available cameras:");
      for (int i = 0; i < cameras.length; i++) {
        println(cameras[i]);
      }
    }
    return cameras;
  }

    
  /*
    Mandatory Camera Code
    void setup() {
      //fullScreen(P3D);
      size(1280,720,P3D);
      camera = new Camera();
      int selectCamera = 0;  // when multiple camera exits which camera to choose
      cam = new Capture(this, width, height, camera.cameras[selectCamera]);
      camera.startCamera();
    }
    
    void draw() {
      camera.runCamera();
    }
  
  */
  
  
}
