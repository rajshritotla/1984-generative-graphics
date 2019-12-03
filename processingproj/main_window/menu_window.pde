import controlP5.*; // import controlP5 library
ControlP5 controlP5; // controlP5 object
public class menu_window extends PApplet {
  color [] colors = new color[7]; 

void setup() {
 
 controlP5 = new ControlP5(this);
controlP5.addSlider("slider_r").setPosition(20,100).setRange(0,255).setValue(100); //slider for red
  controlP5.addSlider("slider_g").setPosition(20,130).setRange(0,255).setValue(100);//slider for green
  controlP5.addSlider("slider_b").setPosition(20,160).setRange(0,255).setValue(100); //slider for blue
 
}
 
void draw() { 
 

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
    
    print("control event from : "+theEvent.getController().getName());
    println(", value : "+theEvent.getController().getValue());
    
    
    if(theEvent.getController().getName()=="slider_r") {
      shape_color_r = theEvent.getController().getValue();
    }
    
    if(theEvent.getController().getName()=="slider_g") {
      shape_color_g = theEvent.getController().getValue();
    }
    
    if(theEvent.getController().getName()=="slider_b") {
      shape_color_b = theEvent.getController().getValue();
    }
  }  
}
}
