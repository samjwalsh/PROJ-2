boolean isMenu = true, isFlightInfo = false;

void setup() {
  noStroke();
  rectMode(CENTER);
  size(2360/4, 1640/4);
}

void draw() {
  if (isMenu) {
    menuScreen();
  } else if (isFlightInfo) {
    flightInfoScreen();
  }
}


void menuScreen() {
  background(#F0BDEF);
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
