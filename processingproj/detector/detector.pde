import java.awt.*;

boolean isHandMovementDetectorWindowCreated = false ; //checks if camera has been initiated

Graphic myGraphic; //graphic instance
Menu_bar mp; //menu bar instance
float xPos; // x position of Graphic
float yPos; // y position of Graphic


boolean didUserChooseMovementDetectorType =false; //has the user chosen a thing to detect
boolean didUserStart = false; //has the user started the application yet

void setup() {  
  //setting up the main app
  smooth();
  noStroke();
  myGraphic = new Graphic(50,530);
  buildMenuBar();
    
}

void settings() {
  size(1200,800); 
}

void buildMenuBar() {
  //building menu bar
  mp = new Menu_bar(this, "Media", 100, 100);
}
 
void draw() {  
  if(didUserChooseMovementDetectorType==false){
    textSize(25);
    text("Please press enter to start",20,50);     
  }
  
  if ( didUserStart == true && didUserChooseMovementDetectorType == false) { 
    //initated the camera
    String[] args = {"TwoFrameTest"};
    HandMovementDetector sa = new HandMovementDetector();
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

//GRAPHIC CLASS
class Graphic {
  float speed = 2;
  boolean moveLeft, moveRight, moveUp, moveDown = false;
 
  Graphic(float x_in, float y_in) {
    //constructor for the graphic
    xPos = x_in;
    yPos = y_in; 
  }
 
  void display() {
    fill(255);
    noStroke();
    background(0);
    ellipse(xPos,yPos,25,25);
  }
  
  
}
import gab.opencv.*;
import processing.video.*;

public class HandMovementDetector extends PApplet {

  Capture video;
  OpenCV opencv;

  public void settings() {
    size(640, 480);
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

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

//menubar
public class Menu_bar {
  JFrame frame;

  public Menu_bar(PApplet app, String name, int width, int height) {
    System.setProperty("apple.laf.useScreenMenuBar", "true");
    frame = (JFrame) ((processing.awt.PSurfaceAWT.SmoothCanvas)app.getSurface().getNative()).getFrame();
    frame.setTitle(name);

    // Creates a menubar for a JFrame
    JMenuBar menu_bar = new JMenuBar();
    // Add the menubar to the frame
    frame.setJMenuBar(menu_bar);
    // Define and add two drop down menu to the menubar
    JMenu import_menu = new JMenu("import");
    JMenu template_menu  = new JMenu("templates");
    JMenu detect_menu = new JMenu("detect");
    JMenu save_menu = new JMenu("save");
    JMenu exit_menu = new JMenu("Exit");
    

    menu_bar.add(import_menu);
    menu_bar.add(detect_menu);
    menu_bar.add(save_menu);
    menu_bar.add(template_menu);
    menu_bar.add(exit_menu);

    // Create and add simple menu item to one of the drop down menu
    JMenuItem new_file = new JMenuItem("Import file");
    JMenuItem new_folder = new JMenuItem("Import folder");
    
    JMenuItem save = new JMenuItem("Save");
    JMenuItem save_as = new JMenuItem("Save As");
    
    JMenuItem ellipse = new JMenuItem("ellipse");
    JMenuItem rectangle = new JMenuItem("rectange");
    
    JMenu move_one_object = new JMenu("move one object");
    JMenu move_background = new JMenu("move background");
    
    JMenuItem detect_face = new JMenuItem("face");
    JMenuItem detect_body = new JMenuItem("body");
    JMenuItem detect_hands = new JMenuItem("hands");

    import_menu.add(new_file);
    import_menu.add(new_folder);
    
    save_menu.add(save);
    save_menu.add(save_as);
    
    move_one_object.add(ellipse);
    move_one_object.add(rectangle);
    
    template_menu.add(move_one_object);
    template_menu.add(move_background);
    
    detect_menu.add(detect_face);
    detect_menu.add(detect_body);
    detect_menu.add(detect_hands);
   
   
    // Add a listener to the New menu item. actionPerformed() method will
    // invoked, if user triggred this menu item
    new_file.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent arg0) {
        System.out.println("You have clicked on the new action");
      }
    }
    );
    frame.setVisible(true);
  }
}
