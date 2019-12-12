import processing.opengl.*;
import controlP5.*;
import java.awt.*;
ControlP5 controlP5;
//detector_window movement;
boolean isHandMovementDetectorWindowCreated = false ; //checks if camera has been initiated
PShape shape;
Image Img;
String img_name;
Graphic myGraphic; //graphic instance
float xPos; // x position of Graphic
float yPos; // y position of Graphic
float zPos;
float shape_color_r; //color of graphic
float shape_color_b; //color of graphic
float shape_color_g; //color of graphic
float xRot; //x rotation of the graphic
float yRot; //y rotation of the graphic
float zRot; //z rotation of the graphic
Button face_detect_button; //button for the face detection
Button fist_detect_button; //button for the fist detection
Button body_detect_button; //button for the body detection
Button rain_button;
Button image_button;
Button import_button;
Button twoD_button; //button to render 2d shape
Button threeD_button; //button to render 3d shape
Button circle_button; //button to render circle shape
Button rectangle_button; //button to render rectangle shape
Button sphere_button; //button to render sphere shape
Button box_button; //button to render box shape
Button enter; //button to enter canvas
Button select_image;
boolean didUserChoose =false; //has the user chose from the starting window yet?
boolean didUserStart = false; //has the user started the application yet
String detect; //xml file to use as detection
boolean wants_twoD; //does user want to render a 2d shape
boolean wants_threeD; //does user want to render a 3d shape
boolean wants_rainGraphic = false; //does user want to rain graphics
boolean hasUserChoseDetector = false; //has the user chose a detector
boolean hasUserChoseTemplate = false; //has a user chose a template
boolean hasUserChosenShape = false; //has user chosen a shape
boolean wants_image = false;
int type; //which shape to use
float size; //size of graphic
int num_vertex;
int[] xvertex;
int[] yvertex;
ControlGroup messageBox;
int messageBoxResult = -1;
String messageBoxString = "";
void setup() {  
  face_detect_button = new Button("Face", 20, 100, 100, 50);
  enter = new Button("Enter", 1000, 700, 100, 50);
  fist_detect_button = new Button("Fist", 130, 100, 100, 50);
  body_detect_button = new Button("Body", 240, 100, 100, 50);
  rain_button = new Button("Rain", 20, 250, 100, 50);
  twoD_button = new Button("2D", 130, 250, 100, 50);
  threeD_button = new Button("3D", 240, 250, 100, 50);
  image_button = new Button("Image", 350, 250, 100, 50);
  circle_button = new Button("Circle", 20, 400, 100, 50);
  rectangle_button = new Button("Rectangle", 130, 400, 100, 50);
  sphere_button = new Button("Sphere", 20, 400, 100, 50);
  box_button = new Button("Box", 130, 400, 100, 50);
  import_button = new Button("Import", 20, 400, 100, 50);
  //setting up the main app
  smooth();
  noStroke();
  myGraphic = new Graphic(50,530,50,255,255,255,100);
  Img = new Image();
  String[] args = {"Menu Window"};
  menu_window mw = new menu_window();
  PApplet.runSketch(args, mw);
}


void settings() {
  // Setting frame size and renderer 
  size(1200,800,P3D);
}

 
void draw() {  
  if(didUserChoose==false){
    face_detect_button.Draw();
    fist_detect_button.Draw();
    body_detect_button.Draw();
    twoD_button.Draw();
    threeD_button.Draw();
    rain_button.Draw();
    image_button.Draw();
    enter.Draw();
    Text movement_detect_string = new Text("Please enter detection", 20, 50, 200,20);
    movement_detect_string.Draw();
    
    Text template_string = new Text("Please select template", 20, 200, 200,20);
    template_string.Draw();
    
    if (wants_twoD) //buttons to show up if user wants 2d shape
    {
      Text twoD_shape_string = new Text("Please select template", 20, 350, 200,20);
      twoD_shape_string.Draw();
      circle_button.Draw();
      rectangle_button.Draw();
    }
    
    if (wants_threeD)//buttons to show up if user wants 3d shape
    {
      Text threeD_shape_string = new Text("Please select shape", 20, 350, 200,20);
      threeD_shape_string.Draw();
      sphere_button.Draw();
      box_button.Draw();
    }
    
    if (wants_image)
    {
      Text select_image_string = new Text("Select Image", 20, 350, 200,20);
      select_image_string.Draw();
      import_button.Draw();
    }
    
    if(wants_rainGraphic)  // initialize rain (StartRaining class) variable
     {
       myGraphic.onStartRaining();
     }
    
  }
  
  if ( didUserStart == true && didUserChoose == false) { 
    //initated the camera
    String[] args = {"Camera Window"};
    detector_window sa = new detector_window();
    PApplet.runSketch(args, sa);
    didUserChoose=true;    
    
  }
  if(isHandMovementDetectorWindowCreated == false && didUserChoose ==true) {
    //initates the drawing pad
    background(0, 0, 0);
    textSize(32);
  }
   if (isHandMovementDetectorWindowCreated == true && didUserChoose == true) {
     //adds graphics to the drawing pad
     if (wants_twoD || wants_threeD || wants_rainGraphic)
     {
       myGraphic.display();
     }
     if (wants_image)
     {
       Img.display();
     }
  }
}


void mousePressed()
{
  if (face_detect_button.MouseIsOver()) //rendering xml file for face detection
  {
    // print some text to the console pane if the button is clicked
    detect = "haarcascade_frontalface_alt.xml";
    hasUserChoseDetector = true;
  }
  if (body_detect_button.MouseIsOver()) //rendering xml file for body detection
  {
    detect = "haarcascade_fullbody.xml";
    hasUserChoseDetector = true;
  }
  if (fist_detect_button.MouseIsOver())//rendering xml file for fist detection
  {
    detect = "fist.xml";
    hasUserChoseDetector = true;
  }
  if (twoD_button.MouseIsOver()) //rendering 2d shape
  {
    wants_twoD = true;
  }
  if (threeD_button.MouseIsOver()) //rendering 3d shape
  {
    wants_threeD = true;
  }
  
  if (circle_button.MouseIsOver() && wants_twoD) //rendering circle shape
  {
    type =  ELLIPSE;
    hasUserChosenShape = true;
  }
  if (rectangle_button.MouseIsOver() && wants_twoD)  //rendering rectangle shape
  {
    type = RECT;
    hasUserChosenShape = true;
  }
  if (rain_button.MouseIsOver())
  {
    wants_rainGraphic = true;
    hasUserChosenShape = true;
  }
  if(enter.MouseIsOver()) //entering canvas 2d shape
  {
    if (hasUserChosenShape && hasUserChoseDetector)
    {
      didUserStart = true;
    }
  }
  if (sphere_button.MouseIsOver() && wants_threeD) //rendering sphere shape
  {
    type = SPHERE;
    hasUserChosenShape = true;
  }
  if(box_button.MouseIsOver() && wants_threeD)//rendering box shape
  {
    type = BOX;
    hasUserChosenShape = true;
  }
  if(image_button.MouseIsOver())
  {
    wants_image = true;
  }
  if(import_button.MouseIsOver() && wants_image)
  {
    import_img();
  }
}

void import_img() {
  //importing image
  selectInput("Select a file to process:", "fileSelected");
}

void fileSelected(File selection) {
  if (selection == null) { //if user did not import a picture
    println("Window was closed or the user hit cancel.");
    showMessageDialog(null, "No image selected.", 
    "Alert", ERROR_MESSAGE);
    import_img();
  } else {
    println("User selected " + selection.getAbsolutePath()); //setting imported pictures to the graphic
    img_name = selection.getAbsolutePath();
    hasUserChosenShape = true;
  }
}
