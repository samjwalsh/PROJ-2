boolean isMenu = true, isFlightInfo = false;
PImage map;
PImage backgroundimage;
String destination = "";

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
   if (mouseX>(100-50) && mouseX<(100+50) &&
    mouseY>(300-25) && mouseY<(300+25)) {
    strokeWeight(4);
    stroke(255);
  } else {
    strokeWeight(0);
  }
}


void flightInfoScreen() {
  strokeWeight(0);
  background(255);
  fill(#C6C6C6);
  rect(70, 370, 100, 50);
  fill(255);
  textSize(10);
  text("Back to menu", 40, 370);
  fill(#88CBED);
  rect(410, 127, 320, 195);
  image(map, 250, 30, 320, 200);
  fill(0);
  textSize(20);
  text("Destination: "+destination, 320, 20);

  if (mouseX>(70-50) && mouseX<(70+50) &&
    mouseY>(370-25) && mouseY<(370+25)) {
    strokeWeight(4);
    stroke(255);
  }
  strokeWeight(0);
  //JFK 1
  if (dist(mouseX, mouseY, 539, 92-15)<10) {
    strokeWeight(4);
    stroke(255);
    destination = "JFK";
  }
  drawPin(539, 92);
  strokeWeight(0);

  //LAX 2
  if (dist(mouseX, mouseY, 259, 104-15)<10) {
    strokeWeight(4);
    stroke(255);
    destination = "LAX";
  }
  drawPin(259, 104);
  strokeWeight(0);
  //ORD 3
  if (dist(mouseX, mouseY, 458, 102-15)<10) {
    strokeWeight(4);
    stroke(255);
    destination = "ORD";
  }
  drawPin(458, 102);
  strokeWeight(0);

  //SEA 4
  if (dist(mouseX, mouseY, 282, 45-15)<10) {
    strokeWeight(4);
    stroke(255);
    destination = "SEA";
  }
  drawPin(282, 45);
  strokeWeight(0);
  //FLL 5
  if (dist(mouseX, mouseY, 515, 189-15)<10) {
    strokeWeight(4);
    stroke(255);
    destination = "FLL";
  }
    drawPin(515, 189);
  strokeWeight(0);
  //HNL 6
  if (dist(mouseX, mouseY, 338, 192-15)<10) {
    strokeWeight(4);
    stroke(255);
    destination = "HNL";
  }
  drawPin(338, 192);
  strokeWeight(0);
  
  //DCA 7
  if (dist(mouseX, mouseY, 520, 117-15)<10) {
    strokeWeight(4);
    stroke(255);
    destination = "DCA";
  }
  drawPin(520, 117);
  strokeWeight(0);
  
  //LAS 8
  if (dist(mouseX, mouseY, 300, 130-15)<10) {
    strokeWeight(4);
    stroke(255);
    destination = "LAS";
  }
  drawPin(300, 130);
  strokeWeight(0);
  //DAL 9
  if (dist(mouseX, mouseY, 414, 167-15)<10) {
    strokeWeight(4);
    stroke(255);
    destination = "DAL";
  }
  drawPin(414, 167);
  strokeWeight(0);
  
   //HOU 10
  if (dist(mouseX, mouseY, 418, 187-15)<10) {
    strokeWeight(4);
    stroke(255);
    destination = "HOU";
  }
  drawPin(418, 187);
  strokeWeight(0);
  
   //MCI 11
  if (dist(mouseX, mouseY, 419, 124-15)<10) {
    strokeWeight(4);
    stroke(255);
    destination = "MCI";
  }
  drawPin(419, 124);
  strokeWeight(0);
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
