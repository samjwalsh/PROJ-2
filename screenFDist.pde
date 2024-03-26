class ScreenFDist extends Screen {
  ScreenFDist(PApplet parent) {
    super(parent);
    add(new Widget(100, 20, 100, 40,
      "Flights By Distance", color(255), font, "FBD"));
  }
  void draw() {
    background(120, 0, 255);
    drawWidgets();
  }
}
