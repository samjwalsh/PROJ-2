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
    add(new Widget(850, 750, 100, 40,
      "Filters", color(255), font, "Filter"));
    add(new Widget(100, 200, 100, 40,
      "Flights By Date", color(255), font, "FBDt"));
    add(new Widget(100, 260, 100, 40,
      "Flights By State", color(255), font, "FState"));
  }
  
  void draw() {
    //background(255, 212, 229);
    image(background,0,0,width,height);
    drawWidgets();
  }
}
