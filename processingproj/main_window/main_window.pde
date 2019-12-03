import processing.opengl.*;
import controlP5.*;
import java.awt.*;
//detector_window movement;
boolean isHandMovementDetectorWindowCreated = false ; //checks if camera has been initiated
PShape square;
Graphic myGraphic; //graphic instance
float xPos; // x position of Graphic
float yPos; // y position of Graphic
float shape_color_r;
float shape_color_b;
float shape_color_g;
float xRot;
float yRot;

boolean didUserChooseMovementDetectorType =false; //has the user chosen a thing to detect
boolean didUserStart = false; //has the user started the application yet

void setup() {  
  //setting up the main app
  smooth();
  noStroke();
  myGraphic = new Graphic(50,530,255,255,255);
  //controlP5 = new ControlP5(this);
  //controlP5.addSlider("slider_r").setPosition(20,100).setRange(0,255).setValue(100); //slider for red
  //controlP5.addSlider("slider_g").setPosition(20,130).setRange(0,255).setValue(100);//slider for green
  //controlP5.addSlider("slider_b").setPosition(20,160).setRange(0,255).setValue(100); //slider for blue
  String[] args = {"ThreeFrameTest"};
  menu_window mw = new menu_window();
  PApplet.runSketch(args, mw);
}

void settings() {
  size(1200,800); 
}

 
void draw() {  
  if(didUserChooseMovementDetectorType==false){
    textSize(25);
    text("Please press enter to start",20,50);     
  }
  
  if ( didUserStart == true && didUserChooseMovementDetectorType == false) { 
    //initated the camera
    String[] args = {"TwoFrameTest"};
    detector_window sa = new detector_window();
    PApplet.runSketch(args, sa);
    didUserChooseMovementDetectorType=true;    
    
  }
  if(isHandMovementDetectorWindowCreated == false && didUserChooseMovementDetectorType ==true) {
    //initates the drawing pad
    background(0, 0, 0);
    textSize(32);
  }
   if (isHandMovementDetectorWindowCreated == true && didUserChooseMovementDetectorType == true) {
     //adds graphics to the drawing pad
     myGraphic.display();
  }
}

//KEYBOARD INPUT
void keyPressed() {
 //when uses presses a key
    didUserStart = true;
}
