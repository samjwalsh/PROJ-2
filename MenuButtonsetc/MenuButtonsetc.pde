// C. Quinn, created processing sketch for UI, 10am, 14/03/2024
boolean isMenu = true, isFlightInfo = false, isDropDown = false, isHideSelection = false;;
PImage map;
PImage backgroundimage;
String destination = "Select destination", selectedFilters = "";
StringList filters;
int destinationWeight = 0,originWeight = 0,airlineWeight = 0, SCREENX = 590, SCREENY = 410;
boolean originFilter, destinationFilter, airlineFilter;


void settings(){
  size(SCREENX, SCREENY);
}

void setup() {
  filters = new StringList();
  noStroke();
  rectMode(CENTER);
  textAlign(CENTER);
  
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
   if(isDropDown){
      dropDownOnScreen();
    }
}
void dropDownOnScreen() {
  fill(#C6C6C6);
  rect(50, 170, 100, 250);
  fill(255);
  rect(52, 172, 80, 230);
  fill(0);
   fill(#C6C6C6);
  rect(50, 50, 100, 20);
  fill(255);
  textSize(10);
  text("Hide selection", 20, 50);
}


void menuScreen() {
  //background(#F0BDEF);
  //C. O'Brien, Added Background Image, 11:40, 14/3/2024.
  background(backgroundimage);

 //C. O'Brien, Moved Buttons, 21:10, 20/3/2024.
  fill(#C6C6C6);
  rect(190, 180, 100, 50);
  fill(255);
  textSize(10);
  text("Press me for flight info!", 190, 180);
  if (mouseX>(190-50) && mouseX<(190+50) &&
    mouseY>(180-25) && mouseY<(180+25)) {
    strokeWeight(4);
    stroke(255);
  } else {
    strokeWeight(0);
  }
}


void flightInfoScreen() {
  background(0);
  fill(255);
  textSize(20);

  text("Current filters: "+selectedFilters, width/2, 40);
  fill(#C6C6C6);


  // C. Quinn, added hover to buttons, 6pm, 14/03/2024
  if (mouseX>(70-50) && mouseX<(70+50) &&
    mouseY>(370-25) && mouseY<(370+25)) {
    strokeWeight(4);
    stroke(255);
  } else {
    strokeWeight(0);
  }
  rect(70, 370, 100, 50);
  fill(255);
  textSize(10);
  text("Back to menu", 70, 370);
  drawFilterButton(100, 100, "Origin",originWeight);
  drawFilterButton(250, 100, "Destination",destinationWeight);
  drawFilterButton(400, 100, "Airline",airlineWeight);
  //drawFilterButton(400, 100, "Distance",airlineWeight);
}

void drawPin(int x, int y) {
  fill(0);
  triangle(x, y, x+3, y-15, x-3, y-15);
  fill(255, 0, 0);
  ellipse(x, y-15, 10, 10);
}

//C. Quinn, added subroutine to buttons to filter data, 1pm, 15/03/2024
void drawFilterButton(int x, int y, String displayMessage,int weighting) {
  strokeWeight(weighting);
  fill(#9DDAF7);
  if (weighting==0) {
    if (mouseX>(x-50) && mouseX<(x+50) &&
      mouseY>(y-25) && mouseY<(y+25)) {
      strokeWeight(4);
      stroke(255);
    } else {
      strokeWeight(0);
    }
  }
  rect(x, y, 100, 50);

  fill(0);
  text(displayMessage, x, y);
}



void mousePressed() {
  // C. Quinn, made buttons for screen, 11am, 14/03/2024
  if (isMenu &&(mouseX>(190-50) && mouseX<(190+50) &&
    mouseY>(180-25) && mouseY<(180+25))) {
    isMenu = false;
    isFlightInfo = true;
  } else if (isFlightInfo && (mouseX>(70-50) && mouseX<(70+50) &&
    mouseY>(370-25) && mouseY<(370+25))) {
    isMenu = true;
    isFlightInfo = false;
  }
  //C. O'Brien, made dropdown menu buttons, 12am, 18/3/2024.
  if (isFlightInfo &&(mouseX>(100-50) && (mouseX<(100+50)&&
    mouseY>(100-25) && mouseY<(100+25)))){
      isDropDown=true;
    }
   if (isFlightInfo &&(mouseX>(50-50) && (mouseX<(50+50)&&
    mouseY>(50-25) && mouseY<(50+25)))){
      isDropDown=false;
 }
  
  // C. Quinn, made filter buttons, 1pm, 15/03/2024
  //origin filter
  if (isFlightInfo && (selectedFilters.indexOf("origin")<0)&&(mouseX>(100-50) && mouseX<(100+50) &&
    mouseY>(100-25) && mouseY<(100+25))) {
    selectedFilters +="origin, ";
    originWeight = 4;
    originFilter = true;
  } else if (isFlightInfo && (selectedFilters.indexOf("origin")>=0)&&(mouseX>(100-50) && mouseX<(100+50) &&
    mouseY>(100-25) && mouseY<(100+25))) {
    selectedFilters =selectedFilters.replace("origin, ", "");
    originWeight = 0;
    originFilter = false;
  }
  
  //destination filter
  if (isFlightInfo && (selectedFilters.indexOf("destination")<0)&&(mouseX>(250-50) && mouseX<(250+50) &&
    mouseY>(100-25) && mouseY<(100+25))) {
    selectedFilters +="destination, ";
    destinationWeight = 4;
    destinationFilter = true;
  } else if (isFlightInfo && (selectedFilters.indexOf("destination")>=0)&&(mouseX>(250-50) && mouseX<(250+50) &&
    mouseY>(100-25) && mouseY<(100+25))) {
    selectedFilters = selectedFilters.replace("destination, ", "");
    destinationWeight = 0;
    destinationFilter = false;
  }
  
  //airline filter
  if (isFlightInfo && (selectedFilters.indexOf("airline")<0)&&(mouseX>(400-50) && mouseX<(400+50) &&
    mouseY>(100-25) && mouseY<(100+25))) {
    selectedFilters +="airline, ";
    airlineWeight = 4;
    airlineFilter = true;
  } else if (isFlightInfo && (selectedFilters.indexOf("airline")>=0)&&(mouseX>(400-50) && mouseX<(400+50) &&
    mouseY>(100-25) && mouseY<(100+25))) {
    selectedFilters = selectedFilters.replace("airline, ", "");
    airlineWeight = 0;
    airlineFilter = false;
  }
}
// C. Quinn, added function to draw map and pins, 1pm, 15/03/2024
//void drawPinsOnMap() {
//  rect(410, 127, 320, 195);
//  image(map, 250, 30, 320, 200);
//  fill(0);
//  textSize(20);
//  text("Destination: "+destination, 320, 20);
//  //JFK 1
//  if (dist(mouseX, mouseY, 539, 92-15)<10) {
//    strokeWeight(4);
//    stroke(255);
//    destination = "JFK";
//  }
//  drawPin(539, 92);
//  strokeWeight(0);

//  //LAX 2
//  if (dist(mouseX, mouseY, 259, 104-15)<10) {
//    strokeWeight(4);
//    stroke(255);
//    destination = "LAX";
//  }
//  drawPin(259, 104);
//  strokeWeight(0);
//  //ORD 3
//  if (dist(mouseX, mouseY, 458, 102-15)<10) {
//    strokeWeight(4);
//    stroke(255);
//    destination = "ORD";
//  }
//  drawPin(458, 102);
//  strokeWeight(0);

//  //SEA 4
//  if (dist(mouseX, mouseY, 282, 45-15)<10) {
//    strokeWeight(4);
//    stroke(255);
//    destination = "SEA";
//  }
//  drawPin(282, 45);
//  strokeWeight(0);
//  //FLL 5
//  if (dist(mouseX, mouseY, 515, 189-15)<10) {
//    strokeWeight(4);
//    stroke(255);
//    destination = "FLL";
//  }
//  drawPin(515, 189);
//  strokeWeight(0);
//  //HNL 6
//  if (dist(mouseX, mouseY, 338, 192-15)<10) {
//    strokeWeight(4);
//    stroke(255);
//    destination = "HNL";
//  }
//  drawPin(338, 192);
//  strokeWeight(0);

//  //DCA 7
//  if (dist(mouseX, mouseY, 520, 117-15)<10) {
//    strokeWeight(4);
//    stroke(255);
//    destination = "DCA";
//  }
//  drawPin(520, 117);
//  strokeWeight(0);

//  //LAS 8
//  if (dist(mouseX, mouseY, 300, 130-15)<10) {
//    strokeWeight(4);
//    stroke(255);
//    destination = "LAS";
//  }
//  drawPin(300, 130);
//  strokeWeight(0);
//  //DAL 9
//  if (dist(mouseX, mouseY, 414, 167-15)<10) {
//    strokeWeight(4);
//    stroke(255);
//    destination = "DAL";
//  }
//  drawPin(414, 167);
//  strokeWeight(0);

//  //HOU 10
//  if (dist(mouseX, mouseY, 418, 187-15)<10) {
//    strokeWeight(4);
//    stroke(255);
//    destination = "HOU";
//  }
//  drawPin(418, 187);
//  strokeWeight(0);

//  //MCI 11
//  if (dist(mouseX, mouseY, 419, 124-15)<10) {
//    strokeWeight(4);
//    stroke(255);
//    destination = "MCI";
//  }
//  drawPin(419, 124);
//  strokeWeight(0);
//}
