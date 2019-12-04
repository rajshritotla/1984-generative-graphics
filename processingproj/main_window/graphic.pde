//graphic class

class Graphic {
  float speed = 2;
  boolean moveLeft, moveRight, moveUp, moveDown = false;
 
  Graphic(float x_in, float y_in, float z_in, float r_color_in, float g_color_in,float b_color_in, float size_in) {
    //constructor for the graphic
    xPos = x_in;
    yPos = y_in; 
    zPos = z_in;
    shape_color_r = r_color_in;
    shape_color_g = g_color_in;
    shape_color_b = b_color_in;
    size = size_in;
  }
 
  void display() {
    noStroke();
    background(0);
    if (wants_twoD)
    {
      shape = createShape(type, xPos, yPos, size, size);
      shape.setFill(color(shape_color_r, shape_color_g,shape_color_b));
      shape(shape, 10, 10);
      shape.rotateX(xRot);
      shape.rotateY(yRot);
    }
    if (wants_threeD)
    {
      if (type == BOX)
      {
        shape = createShape(type, size, size, size);
        shape.translate(xPos, yPos, 50);
      }
      else if (type == SPHERE)
      {
        shape = createShape(type, size);
        shape.translate(xPos, yPos, 50);
      }
    }
  }
}
