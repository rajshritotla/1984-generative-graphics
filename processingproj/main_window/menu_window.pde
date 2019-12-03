import controlP5.*;
public class menu_window extends PApplet {
  void setup() {  
  //setting up the main app
  smooth();
  noStroke();
  myGraphic = new Graphic(50,530,255,255,255);
  controlP5 = new ControlP5(this);
  controlP5.addSlider("slider_r").setPosition(20,100).setRange(0,255).setValue(100); //slider for red
  controlP5.addSlider("slider_g").setPosition(20,130).setRange(0,255).setValue(100);//slider for green
  controlP5.addSlider("slider_b").setPosition(20,160).setRange(0,255).setValue(100); //slider for blue
  }
}
