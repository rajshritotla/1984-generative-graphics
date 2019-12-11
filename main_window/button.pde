//button class
//source code from https://blog.startingelectronics.com/a-simple-button-for-processing-language-code/
class Button {
  String label; // button label
  float x;      // top left corner x position
  float y;      // top left corner y position
  float w;      // width of button
  float h;      // height of button
  int col = 218;
  // constructor
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  void Draw() {
    fill(col);
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
  
  boolean MouseIsOver() {
    //indicator to help produce actions when bButtons are clicked
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      //indicator that button is clicked
      col=65;
      return true;
    }
    return false;
  }
}
