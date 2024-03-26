class ScreenHome extends Screen {
  ScreenHome(PApplet parent) {
    super(parent);
    add(new Widget(100, 20, 100, 40,
      "Flights By Day Of Week", color(255), font, "FBD"));
          add(new Widget(100, 80, 100, 40,
      "Flights By Distance", color(255), font, "FDist"));
  }
  void draw() {
    background(120, 0, 255);
    drawWidgets();
  }
}
