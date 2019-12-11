import static javax.swing.JOptionPane.*;
class Graphic {
  float speed = 2;
  boolean moveLeft, moveRight, moveUp, moveDown = false;
  StartRaining startRaining; 
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
    
  
  void onStartRaining() {
    // if user wants rain initialize the variable only in that case
    // called when user chooses Rain button
    startRaining = new StartRaining();
  }
  
  void display() {
    
    /*_____________________________________________________ 2 D __________________________________________________________________*/
    
    if (wants_twoD)
    //2d shape creation
    {
      noStroke();
      background(0);
      //shape.rotateX(xRot);
      //shape.rotateY(yRot);
       shape = createShape(type, xPos, yPos, size, size);
      shape.setFill(color(shape_color_r, shape_color_g,shape_color_b));
      //giving rotations
      translate(width/2, height/2);
     rotate(radians(zRot));
      shape(shape, 10, 10);
    }
    
    
    /*_____________________________________________________ 3 D __________________________________________________________________*/
    
    if (wants_threeD)
    //3d shape creation
    {
      if (type == BOX) //case if type of shape is box
      {
        background(0);  // default background
        lights();
        // color to be filled, controlled by UI
        fill(shape_color_r, shape_color_g, shape_color_b);  
        //  border color
        noStroke();  
      }
      else if (type == SPHERE) //case if type of shape is sphere
      {
        background(0);
        lights();
        noFill();
        // border color, controlled by UI
        stroke(color(shape_color_r, shape_color_g, shape_color_b));
      }
         pushMatrix();
        translate(xPos, yPos, 50);  
        // creates sphere
        shape = createShape(type, size/3); 
        // to rotate along x axis
        shape.rotateX(xRot);
        // to rotate along y axis
        shape.rotateY(yRot);
        //to rotate along z axis
        shape.rotate(zRot, 0.0, 0.0, 1.0);
        shape(shape, 10, 10);
        popMatrix();

    }
    
    /*_____________________________________________________ Rain Graphic __________________________________________________________________*/
    
    if(wants_rainGraphic) {
    // wants RAIN graphic
       startRaining.rain();
       shape = createShape(RECT, xPos, yPos, size, height);
       shape.setStroke(0);
       shape.setFill(color(shape_color_r, shape_color_g,shape_color_b));  // Remove this line of code when projecting, only for DEMO
       shape(shape);
    }
  }
  
 void customDisplay(int num_vertices, int[] xVertices, int[] yVertices)
 {
   shape = createShape();
   shape.beginShape();
  shape.fill(0, 0, 255);
  shape.noStroke();
  for (int i = 0; i < num_vertices; i++)
  {
    shape.vertex(xVertices[i], yVertices[i]);
    shape.endShape(CLOSE);
  }
  shape(shape, 25, 25);
   
 }
    
}
