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
  myGraphic.move();
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
    ellipse(25,25,25,25);
  }
  
  void move() {    
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
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);    //initally detecting face
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
      //printing coordinates of the faces
      println(faces[i].x + "," + faces[i].y);
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height); //laying rectangles on to faces
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
    JMenu text_menu = new JMenu("text");
    JMenu shape_menu = new JMenu("shape");
    JMenu image_menu = new JMenu("image");
    JMenu video_menu = new JMenu("video");

    menu_bar.add(import_menu);
    menu_bar.add(text_menu);
    menu_bar.add(shape_menu);
    menu_bar.add(image_menu);
    menu_bar.add(video_menu);

    // Create and add simple menu item to one of the drop down menu
    JMenuItem new_file = new JMenuItem("Import file");
    JMenuItem new_folder = new JMenuItem("Import folder");
    JMenuItem action_exit = new JMenuItem("Exit");

    import_menu.add(new_file);
    import_menu.add(new_folder);
    import_menu.addSeparator();
    import_menu.add(action_exit);

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
