import processing.opengl.*;
import controlP5.*;
import java.awt.*;
//detector_window movement;
boolean isHandMovementDetectorWindowCreated = false ; //checks if camera has been initiated
PShape square;
twoDGraphic my2dGraphic; //graphic instance
float xPos; // x position of Graphic
float yPos; // y position of Graphic
float shape_color_r;
float shape_color_b;
float shape_color_g;
float xRot;
float yRot;
Button face_detect_button;
Button fist_detect_button;
Button body_detect_button;
Button rain_button;
Button twoD_button;
Button threeD_button;
Button circle_button;
Button rectangle_button;
Button sphere_button;
Button enter;
boolean didUserChooseMovementDetectorType =false; //has the user chosen a thing to detect
boolean didUserStart = false; //has the user started the application yet
String detect;
boolean wants_twoD;
boolean wants_threeD;
boolean hasUserChoseDetector = false;
boolean hasUserChoseTemplate = false;
boolean hasUserChosenShape = false;
int type;

void setup() {  
  face_detect_button = new Button("Face", 20, 100, 100, 50);
  enter = new Button("Enter", 1000, 700, 100, 50);
  fist_detect_button = new Button("Fist", 130, 100, 100, 50);
  body_detect_button = new Button("Body", 240, 100, 100, 50);
  rain_button = new Button("Rain", 20, 250, 100, 50);
  twoD_button = new Button("2D", 130, 250, 100, 50);
  threeD_button = new Button("3D", 240, 250, 100, 50);
  circle_button = new Button("Circle", 20, 400, 100, 50);
  rectangle_button = new Button("Rectangle", 130, 400, 100, 50);
  sphere_button = new Button("Sphere", 20, 400, 100, 50);
  //setting up the main app
  smooth();
  noStroke();
  myGraphic = new Graphic(50,530,255,255,255);
  String[] args = {"Menu Window"};
  menu_window mw = new menu_window();
  PApplet.runSketch(args, mw);
}

void settings() {
  size(1200,800); 
}

 
void draw() {  
  if(didUserChooseMovementDetectorType==false){
    face_detect_button.Draw();
    fist_detect_button.Draw();
    body_detect_button.Draw();
    twoD_button.Draw();
    threeD_button.Draw();
    rain_button.Draw();
    enter.Draw();
    Text movement_detect_string = new Text("Please enter detection", 20, 50, 200,20);
    movement_detect_string.Draw();
    
    Text template_string = new Text("Please select template", 20, 200, 200,20);
    template_string.Draw();
    
    if (wants_twoD)
    {
      Text twoD_shape_string = new Text("Please select template", 20, 350, 200,20);
      twoD_shape_string.Draw();
      circle_button.Draw();
      rectangle_button.Draw();
    }
    
    if (wants_threeD)
    {
      Text threeD_shape_string = new Text("Please select template", 20, 350, 200,20);
      threeD_shape_string.Draw();
      sphere_button.Draw();
    }
    
  }
  
  if ( didUserStart == true && didUserChooseMovementDetectorType == false) { 
    //initated the camera
    String[] args = {"Camera Window"};
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
     if (wants_twoD)
     {
       my2dGraphic.display();
     }
  }
}

//KEYBOARD INPUT
//void keyPressed() {
// //when uses presses a key
//    didUserStart = true;
//}

void mousePressed()
{
  if (face_detect_button.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    detect = "haarcascade_frontalface_alt.xml";
    hasUserChoseDetector = true;
  }
  if (body_detect_button.MouseIsOver())
  {
    detect = "";
    hasUserChoseDetector = true;
  }
  if (fist_detect_button.MouseIsOver())
  {
    detect = "fist.xml";
    hasUserChoseDetector = true;
  }
  if (twoD_button.MouseIsOver())
  {
    wants_twoD = true;
  }
  if (threeD_button.MouseIsOver())
  {
    wants_threeD = true;
  }
  
  if (circle_button.MouseIsOver())
  {
    type =  ELLIPSE;
    hasUserChosenShape = true;
  }
  if (rectangle_button.MouseIsOver())
  {
    type = RECT;
    hasUserChosenShape = true;
  }
  if (rain_button.MouseIsOver())
  {
    hasUserChosenShape = true;
  }
  if(enter.MouseIsOver())
  {
    if (hasUserChosenShape && hasUserChoseDetector)
    {
      didUserStart = true;
    }
  }
}
