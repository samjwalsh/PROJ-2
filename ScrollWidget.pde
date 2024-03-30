// C. O'Brien, created code to implement scroll menu, 21:30 29/03/2024
class ScrollWidget {
  int currentPage = 0;
  int airportsPerPage;
  int totalPages;
  String[] airports;

  //C. Quinn, added more variables, 21:50, 29/03/2024
  int xpos, ypos, rectW, rectH, nextBtnXPos, prevBtnXPos, btnYPos;
  String title;
 
  

  // C. Quinn, added constructor, 21:50, 29/03/2024
  ScrollWidget(int xpos, int ypos, int rectW, int rectH,String title) {
    this.xpos = xpos; this.ypos = ypos; this.rectW = rectW;
    this.rectH = rectH; this.title = title;
    airportsPerPage = ceil((rectH - 25)/30);
    prevBtnXPos = xpos;
    nextBtnXPos = xpos+rectW-50;
    btnYPos = ypos+rectH+10;
    
    
    // C. Quinn, put everything from void setup into constructor, 21:50, 29/03/2024
    noStroke();
    textAlign(CENTER);
    DataReader1 reader = new DataReader1("flights_full.csv");
    HashSet<String> uniqueOriginAirports = reader.readOriginAirports();
    ArrayList<String> originAirportsList = new ArrayList<String>(uniqueOriginAirports);
    Collections.sort(originAirportsList);
    airports = originAirportsList.toArray(new String[0]);
    totalPages = ceil((float)airports.length / airportsPerPage);
    airportChecks = new CheckBox(xpos+25,ypos+(25/2)-3,airportsPerPage,color(244, 144, 185),"",airports,true);
  }

  void draw() {
    //background(255, 212, 229);
    drawUI();
    displayCurrentPageAirports();
  }

  void drawUI() {
    fill(244, 144, 185);
    rect(xpos, ypos, rectW, rectH);
    fill(255);
    rect(xpos+(25/2), ypos+(25/2), rectW-25, rectH-25);
    textSize(20);
    fill(0); // Text color
    text(title, xpos, ypos-15);
    
    fill(149, 199, 194);
    rect(prevBtnXPos, btnYPos, 50, 30);
    fill(0);
    textSize(10);
    text("BACK", xpos+10, btnYPos+20);
    fill(149, 199, 194);
    rect(nextBtnXPos, btnYPos, 50, 30);
    fill(0);
    text("NEXT", nextBtnXPos+10, btnYPos+20);
    stroke(150);
    
  }

  void displayCurrentPageAirports() {
    int startIdx = currentPage * airportsPerPage;
    int endIdx = min(startIdx + airportsPerPage, airports.length);
    textSize(12);
    fill(0);
    
    // C. Quinn, added for loop to draw background for table, 12:00 30/03/2024
    int changingYPos = ypos+(25/2)+2;
    for(int i = 0; i < airportsPerPage; i++){
      if(i%2 == 0){
        fill(220);
      }else {
        fill(255);
      }
      rect(xpos+(25/2),changingYPos,rectW-25, 30);
      changingYPos+=30;
    }
    airportChecks.draw();
    //for (int i = startIdx; i < endIdx; i++) {
    //  fill(0);
    //  int yPos = ypos+27 + (i - startIdx) * 20; // Adjust spacing and position as needed
    //  text(airports[i], xpos+30, yPos);
    //}
  }

  void needMousePressed(int mx, int my) {
    if (mx >= nextBtnXPos && mx <= nextBtnXPos+50 && my >= btnYPos && my <= btnYPos+15) {
      if (currentPage < totalPages - 1) {
        currentPage++;
      }
    }

    if (mx >= prevBtnXPos && mx <= prevBtnXPos+50 && my >= btnYPos && my <= btnYPos+15) {
      if (currentPage > 0) {
        currentPage--;
      }
    }
  }
}
