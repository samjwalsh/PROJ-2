// C. Quinn created widget class, 1pm, 27/03/2024

class buttonWidget {
  int x, y, w, h;
  String text;
  color buttonColour, textColour;
  int strokeweight = 0;
  boolean permOutline = false;

  buttonWidget(int x, int y, int w, int h, String text, color bColour, color tColour) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    buttonColour = bColour;
    textColour = tColour;
  }

  void draw() {
    if (permOutline) {
      strokeWeight(4);
    } else {
      strokeWeight(strokeweight);
    }

    fill(buttonColour);
    rect(x, y, w, h);
    fill(textColour);
    textSize(10);
    text(text, x, y);
    if (permOutline == false) {
      if (mouseX>(x-(w/2)) && mouseX<(x+(w/2)) &&
        mouseY>(y-(h/2)) && mouseY<(y+(h/2))) {
        strokeweight = 4;
        stroke(255);
      } else {
        strokeweight = 0;
      }
    }
  }

  boolean pressed(int MX, int MY) {
    if (MX>(x-(w/2)) && MX<(x+(w/2)) &&
      MY>(y-(h/2)) && MY<(y+(h/2))) {
      return true;
    } else {
      return false;
    }
  }
}
