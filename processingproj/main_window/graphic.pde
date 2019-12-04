class Graphic {
  float speed = 2;
  boolean moveLeft, moveRight, moveUp, moveDown = false;
 
  Graphic(float x_in, float y_in,float r_color_in, float g_color_in,float b_color_in) {
    //constructor for the graphic
    xPos = x_in;
    yPos = y_in; 
    shape_color_r = r_color_in;
    shape_color_g = g_color_in;
    shape_color_b = b_color_in;
  }
 
  void display() {
    noStroke();
    background(0);
    // uncomment these when ui is done
    //if (want_shape) //ecompasses both 2d and 3d shapes
    //{ 
    //graphic = createShape(SHAPE,80,80,80,80);
    //graphic.setFill(color(shape_color_r, shape_color_g,shape_color_b));
    //shape(graphic, 10, 10);
    //}
    //if(want_import_image)
    //{
    //  graphic = loadShape(loadimg);
    //  shape(graphic, 10, 10);
    //}
    //if(want_custom_shape)
    //{
    //  graphic = createShape();
    //  graphic.beginShape();
    //  graphic.noStroke();
    //  for (int i = 0; i < vertices;i++)
    //  {
    //    graphic.vertex(0,0); //adding vertices
    //  }
    //  graphic.endShape(CLOSE);
    //  shape(graphic, 10, 10);
    //}
    square = createShape(type, xPos, yPos, 80, 80);
    square.setFill(color(shape_color_r, shape_color_g,shape_color_b));
    shape(square, 10, 10);
    square.rotateX(xRot);
    square.rotateY(yRot);
  }
  
  
}
