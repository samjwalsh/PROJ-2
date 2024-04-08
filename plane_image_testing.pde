Screen screen = new Screen();
PImage planeImage; PImage planeImageFlipped;

void setup(){
  
   size(400, 400); background(255);
    planeImage = loadImage("planenewimage.PNG");
    planeImageFlipped = loadImage("planenewimage copy.jpeg");
  
}

void draw(){
  screen.move();
  screen.draw(planeImage, planeImageFlipped);
}
