// C. Quinn, Created class for slider, 11:00, 29/03/2024
class SliderWidget {
  float startRange, endRange, barX1, barX2, slider1Xpos, slider2Xpos, midpoint;
  color hilightColour;
  String title;
  boolean hold1 = false, hold2 = false;
  float displayText1, displayText2, barY;

  SliderWidget (float barX1, float barX2, int barY, color hilightColour, int startRange, int endRange, String title) {
    this.barX1 = barX1;
    this.barX2 = barX2;
    this.barY = barY;
    this.hilightColour = hilightColour;
    this.startRange = startRange;
    this.endRange = endRange;
    this.title = title;
    slider1Xpos = barX1;
    slider2Xpos = barX2;
    midpoint = barX1+((barX2-barX1)/2);
    textAlign(CENTER);
  }

  void draw() {
    // check if still holding slider
    if (!mousePressed) {
      hold1 = false;
    }
    if (!mousePressed) {
      hold2 = false;
    }

    //set line with given x values and y
    stroke(0);
    line(barX1, barY, barX2, barY);
    //slide optns
    fill(hilightColour);
    noStroke();
    rect(slider1Xpos, barY-1, (slider2Xpos-slider1Xpos), 2);
    stroke(2);
    if (dist(mouseX, mouseY, slider1Xpos, barY)<10) {
      stroke(255);
    } else stroke(0);
    ellipse(slider1Xpos, barY, 10, 10);
    if (dist(mouseX, mouseY, slider2Xpos, barY)<10) {
      stroke(255);
    } else stroke(0);
    ellipse(slider2Xpos, barY, 10, 10);
    stroke(0);
    textSize(30);
    fill(0);
    text(title, midpoint-70, barY-25);
  }

  void update(int mx, int my) {
    //find the distance value that corresponds to the slider
    displayText1 = startRange+dist(barX1, barY, slider1Xpos, barY)*((endRange-startRange)/dist(barX1, barY, barX2, barY));
    displayText2 =startRange+dist(barX1, barY, slider2Xpos, barY)*((endRange-startRange)/dist(barX1, barY, barX2, barY));
    textSize(10);

    text(int(displayText1), slider1Xpos-5, barY+15);
    text(int(displayText2), slider2Xpos-5, barY+15);

    // use constrain function so cannot be dragged off the line
    if (hold1) {
      slider1Xpos = constrain(mx, barX1, slider2Xpos-10);
    }
    if (hold2) {
      slider2Xpos = constrain(mx, slider1Xpos+10, barX2);
    }
  }
  
  int[] getBounds() {
    return new int[]{int(displayText1), int(displayText2)};
  }

  void mousePressed(int mx, int my) {
    // check if each slider is being held
    if (dist(mx, my, slider1Xpos, barY)<5) {
      //stroke(255);
      if (mousePressed) {
        hold1 = true;
      } else {
        hold1 = false;
      }
    }
    if (dist(mx, my, slider2Xpos, barY)<5) {
      //stroke(255);
      if (mousePressed) {
        hold2 = true;
      } else {
        hold2 = false;
      }
    }
  }
}
