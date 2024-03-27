// S. Walsh, Created screen class for homescreen, 22:00 26/03/2024
class ScreenHome extends Screen {
  ScreenHome(PApplet parent) {
    super(parent);
    add(new Widget(100, 20, 100, 40,
      "Flights By Day Of Week", color(255), font, "FBD"));
    add(new Widget(100, 80, 100, 40,
      "Flights By Distance", color(255), font, "FDist"));
    add(new Widget(100, 140, 100, 40,
      "Marketshare", color(255), font, "MShare"));
  }
  void draw() {
    background(120, 0, 255);
    drawWidgets();
  }
}
