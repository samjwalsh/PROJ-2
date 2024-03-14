boolean isMenu = true, isFlightInfo = false;
PImage map;
PImage backgroundimage;

void setup() {
  noStroke();
  rectMode(CENTER);
  size(2360/4, 1640/4);
  map = loadImage("map.png");
  backgroundimage =  loadImage("background2.png");
  backgroundimage.resize(2360/4, 1640/4);
}

void draw() {
  if (isMenu) {
    menuScreen();
  } else if (isFlightInfo) {
    flightInfoScreen();
  }
}


void menuScreen() {
  //background(#F0BDEF);
 //C. O'Brien, Added Background Image, 11:40, 14/3/2024.
  background(backgroundimage);
  fill(#C6C6C6);
  rect(100, 300, 100, 50);
  fill(255);
  textSize(10);
  text("Press me for flight info!", 50, 300);
}

void flightInfoScreen() {
  background(255);
  fill(#C6C6C6);
  rect(70, 370, 100, 50);
  fill(255);
  textSize(10);
  text("Back to menu", 40, 370);
  fill(#88CBED);
  rect(410,127,320,195);
  image(map, 250, 30,320,200);
  
  //JFK
  drawPin(539,92);
  //LAX
  drawPin(259,104);
  //ORD
  drawPin(458,102);
  //SEA
  drawPin(282,45);
  //FLL
  drawPin(515,189);
  //HNL
  drawPin(338,192);
  //DCA
  drawPin(520,117);
}

void drawPin(int x, int y){
  fill(0);
  triangle(x,y,x+3,y-15,x-3,y-15);
  fill(255,0,0);
  ellipse(x,y-15,10,10);
}

void mousePressed() {
  if (isMenu &&(mouseX>(100-50) && mouseX<(100+50) &&
    mouseY>(300-25) && mouseY<(300+25))) {
    isMenu = false;
    isFlightInfo = true;
  } else if (isFlightInfo && (mouseX>(70-50) && mouseX<(70+50) &&
    mouseY>(370-25) && mouseY<(370+25))) {
    isMenu = true;
    isFlightInfo = false;
  }
}
