class Image
{
  PImage photo;

void display()
{
  background(0); //clearing canvas for each frame
  fill(255);
  noStroke();
  photo = loadImage(img_name);
  photo.resize((int)size, (int)size);
  image(photo,xPos,yPos);
  rotateX(xRot);
  rotateY(yRot);
}
}
