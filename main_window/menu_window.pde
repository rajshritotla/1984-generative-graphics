//menu window class
import controlP5.*; // import controlP5 library // controlP5 object
DropdownList file;
DropdownList save;
DropdownList exit;

public class menu_window extends PApplet {
  color [] colors = new color[7]; 

void setup() {
 
 controlP5 = new ControlP5(this);
 //slider for the gui
  controlP5.addSlider("slider_r").setPosition(20, 120).setRange(0,255).setValue(100); //slider for red
  controlP5.addSlider("slider_g").setPosition(20,140).setRange(0,255).setValue(100);//slider for green
  controlP5.addSlider("slider_b").setPosition(20,160).setRange(0,255).setValue(100); //slider for blue
  controlP5.addSlider("size").setPosition(20,180).setRange(0,500).setValue(100); //slider for size
  controlP5.addSlider("x_rotation").setPosition(20,200).setRange(0,360).setValue(100); //slider for x rotation
  controlP5.addSlider("y_rotation").setPosition(20,220).setRange(0,360).setValue(100);//slider for y rotation
  controlP5.addSlider("z_rotation").setPosition(20,240).setRange(0,360).setValue(100);//slider for y rotation
  file = controlP5.addDropdownList("File").setPosition(20, 10);
  save = controlP5.addDropdownList("Save").setPosition(150, 10);
  controlP5.addButton("Exit").setPosition(280, 10).setColorBackground(color(60));
  String [] save_menu = {"Save", "Save As"};
  String [] file_menu = {"Open", "New", "Export"};
  customize(file, file_menu);
  customize(save, save_menu);
  
 
}
void customize(DropdownList ddl, String[] names) {
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  for (int i = 0; i < names.length ; i++)
  {
    ddl.addItem(names[i],i+1); 
  }
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255,128));
}
 
void draw() { 
 //need this function for the gui to work properly.
  background(128);

}
void settings()
{
  size(370, 300,P3D);
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
    if(theEvent.getController().getName()=="z_rotation") {
      zRot= theEvent.getController().getValue();
    }
    if(theEvent.getController().getName()=="Exit") {
      exit();
    }
 
    
  }  
}
}
