class Image
{
  PImage photo;

void display()
{
  background(0); //clearing canvas for each frame
  fill(255);
  noStroke();
    //giving rotations
translate(width/2, height/2);
 rotate(radians(zRot));
  photo = loadImage(img_name);
  photo.resize((int)size, (int)size);
  image(photo,xPos,yPos);
  //giving color tining
  tint(shape_color_r, shape_color_g,shape_color_b);
}
}
