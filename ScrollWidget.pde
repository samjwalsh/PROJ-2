// C. O'Brien, created code to implement scroll menu, 21:30 29/03/2024
class ScrollWidget {
  int currentPage = 0;
  int airportsPerPage;
  int totalPages;
  String[] airports;
  int xposChange, yposChange;
  //C. Quinn, added more variables, 21:50, 29/03/2024
  int xpos, ypos, rectW, rectH, nextBtnXPos, prevBtnXPos, btnYPos;
  String title;

  //CheckBox airportChecks;

  // C. Quinn, added constructor, 21:50, 29/03/2024
  ScrollWidget(int xpos, int ypos, int rectW, int rectH, String title) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.rectW = rectW;
    this.rectH = rectH;
    this.title = title;
    airportsPerPage = ceil((rectH - 25)/30);
    prevBtnXPos = xpos;
    nextBtnXPos = xpos+rectW-50;
    btnYPos = ypos+rectH+10;
    xposChange = xpos;
    yposChange = ypos+4;

    // C. O'Brien, moved from made from void setup into constructor, 21:50, 29/03/2024

    textAlign(CENTER);
    DataReader1 reader = new DataReader1("flights_full.csv");
    HashSet<String> uniqueOriginAirports = reader.readOriginAirports();
    ArrayList<String> originAirportsList = new ArrayList<String>(uniqueOriginAirports);
    Collections.sort(originAirportsList);
    airports = originAirportsList.toArray(new String[0]);
    totalPages = ceil((float)airports.length / airportsPerPage);
    if (title.contains("Origin")) {
      originAirportChecks = new CheckBox(xpos+25, yposChange, airports.length, color(244, 144, 185), "", airports, true, true);
    } else {
      destinationAirportChecks = new CheckBox(xpos+25, yposChange, airports.length, color(244, 144, 185), "", airports, true, true);
    }
  }

  void draw() {
    //background(255, 212, 229);
    drawUI();
    noStroke();
    displayCurrentPageAirports();
  }

  void drawUI() {
    fill(244, 144, 185);
    rect(xpos, ypos, rectW, rectH);
    fill(255);
    rect(xpos+(25/2), ypos+(25/2), rectW-25, rectH-25);


    //fill(149, 199, 194);
    //rect(prevBtnXPos, btnYPos, 50, 30);
    //fill(0);
    //textSize(10);
    //text("BACK", xpos+10, btnYPos+20);
    //fill(149, 199, 194);
    //rect(nextBtnXPos, btnYPos, 50, 30);
    //fill(0);
    //text("NEXT", nextBtnXPos+10, btnYPos+20);
    stroke(150);
  }

  void displayCurrentPageAirports() {

    textSize(12);
    fill(0);

    // C. Quinn, added for loop to draw background for table, 12:00 30/03/2024
    int changingYPos = ypos+(25/2)+2;
    for (int i = 0; i < airportsPerPage; i++) {
      if (i%2 == 0) {
        fill(220);
      } else {
        fill(255);
      }
      rect(xpos+(25/2), changingYPos, rectW-25, 30);
      changingYPos+=30;
    }
    if (title.contains("Origin")) {
      originAirportChecks.draw();
    } else {
      destinationAirportChecks.draw();
    }
    noStroke();

    fill(255, 212, 229);
    rect(xpos, 0, rectW, 425);

    //fill(255, 212, 229);
    rect(xpos, 680, rectW, 120);//rectangles to cover lsit
    textSize(20);
    fill(0); // Text color
    text(title, xpos, ypos-15);
  }

  void mousePressed() { 
    //  only relevant mouse pressed
    if (title.contains("Origin")) {
      originAirportChecks.mousePressed(mouseX, mouseY);
    } else {
      destinationAirportChecks.mousePressed(mouseX, mouseY);
    }
  }
  void mouseWheel(MouseEvent event) {
    // scrolling
    if (mouseX> xpos && mouseX < xpos+rectW && mouseY > ypos && mouseY < ypos+rectH) { // hover doesent work?
      float e = event.getCount();
      if (title.contains("Origin")) {
        originAirportChecks.needMouseWheel(e);
      } else {
        destinationAirportChecks.needMouseWheel(e);
      }
    }
  }
}
