// S. Walsh, Created class for reusable toggle UI element, 22:00 26/03/2024

class ToggleBox extends Widget {
  color enabledColor;
  color disabledColor;
  boolean enabled = true;
  ToggleBox(int x, int y, int width, int height,
    String label, color enabledColor, PFont font, String event, color disabledColor) {
    super(x, y, width, height, label, enabledColor, font, event);
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColor=enabledColor;
    this.enabledColor = enabledColor;
    this.disabledColor = disabledColor;
    this.widgetFont=font;
    labelColor=color(0);
    rectMode(CORNER);
  }
  void draw() {
    fill(widgetColor);
    rect(x, y, width, height);
    fill(labelColor);
    text(label, x+10, y+height-10);
  }
  String getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return "null";
  }
  void toggle() {
    enabled = !enabled;
    if (enabled) {
      widgetColor = enabledColor;
    } else {
      widgetColor = disabledColor;
    }
  }
}
