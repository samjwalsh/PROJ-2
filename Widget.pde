// S. Walsh, Created class for buttons, 22:00 26/03/2024

class Widget {
  int x, y, width, height;
  String label;
  String event;
  color widgetColor, labelColor;
  PFont widgetFont;
  Widget(int x, int y, int width, int height, String label,
    color widgetColor, PFont widgetFont, String event) {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    labelColor= color(0);
    textAlign(CENTER);
    rectMode(CORNER);
  }
  void draw() {
    boolean mousedOver = false;
    if(mouseX>x && mouseX<(x+width) && mouseY>y && mouseY<(y+height)){
mousedOver = true;
    }
    else{
      stroke(255);
    }
    if (mousedOver) fill(255);
    else fill(widgetColor);
    textAlign(CENTER);
    rectMode(CORNER);
    rect(x, y, width, height);
    fill(labelColor);
    text(label, x+(width/2), y+(height/2));
    stroke(255);
  }
  String getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return "null";
  }
  void toggle() {}
}
