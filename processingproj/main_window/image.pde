class Image
{
  PImage photo;

void display()
{
  background(0); //clearing canvas for each frame
  fill(255);
  noStroke();
  photo = loadImage(img_name);
  photo.resize(80,80);
  image(photo,xPos,yPos);
}
}
