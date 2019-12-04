//menu window class
//source code comes from 
import controlP5.*; // import controlP5 library
ControlP5 controlP5; // controlP5 object
Menu_bar mp;
public class menu_window extends PApplet {
  color [] colors = new color[7]; 

void setup() {
 
 controlP5 = new ControlP5(this);
 //slider for the gui
  controlP5.addSlider("slider_r").setPosition(20, 30).setRange(0,255).setValue(100); //slider for red
  controlP5.addSlider("slider_g").setPosition(20,60).setRange(0,255).setValue(100);//slider for green
  controlP5.addSlider("slider_b").setPosition(20,90).setRange(0,255).setValue(100); //slider for blue
  controlP5.addSlider("size").setPosition(20,120).setRange(0,500).setValue(100); //slider for size
  controlP5.addSlider("x_rotation").setPosition(20,150).setRange(0,255).setValue(100); //slider for x rotation
  controlP5.addSlider("y_rotation").setPosition(20,180).setRange(0,255).setValue(100);//slider for y rotation
  buildMenuBar();
 
}
void buildMenuBar() {
  //building menu bar
  mp = new Menu_bar(this, "Media");
}
 
void draw() { 
 //need this function for the gui to work properly.

}
void settings()
{
  size(330,260);
}
  void controlEvent(ControlEvent theEvent) {
  /* events triggered by controllers are automatically forwarolEvent theEvent) {
  /* events triggered by controllers are automatically forwarded to 
     the controlEvent method. by checking the name of a controller one can 
     distinguish which of the controllers has been changed.
  */ 
 
  /* check if the event is from a controller otherwise you'll get an error
     when clicking other interface elements like Radiobutton that don't support
     the controller() methods
  */
  
  if(theEvent.isController()) { 
    
    //action for red slider
    if(theEvent.getController().getName()=="slider_r") {
      shape_color_r = theEvent.getController().getValue();
    }
    
    //action for green slider
    if(theEvent.getController().getName()=="slider_g") {
      shape_color_g = theEvent.getController().getValue();
    }
    
    //action for blue slider
    if(theEvent.getController().getName()=="slider_b") {
      shape_color_b = theEvent.getController().getValue();
    }
    
    //action for size slider
    if(theEvent.getController().getName()=="size") {
      size= theEvent.getController().getValue();
    }
    
    //action for x rotation slider
    if(theEvent.getController().getName()=="x_rotation") {
      xRot= theEvent.getController().getValue();
    }
    
    //action for y rotation slider
    if(theEvent.getController().getName()=="y_rotation") {
      yRot= theEvent.getController().getValue();
    }
  }  
}
}
