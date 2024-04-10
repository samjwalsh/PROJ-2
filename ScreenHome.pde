// S. Walsh, Created screen class for homescreen, 22:00 26/03/2024
class ScreenHome extends Screen {
  ScreenHome(PApplet parent) {
    super(parent);
    add(new Widget(552, 230, 391, 70,
      "Flights By Day Of Week", color(254,235,201), font, "FBD"));
    add(new Widget(552, 300, 196, 70,
      "Flights By Distance", color(224,243,176), font, "FDist"));
    add(new Widget(552, 370, 196, 70,
      "Marketshare", color(179,226,221), font, "MShare"));
    add(new Widget(552, 440, 196, 70,
      "Flights By Date", color(191,213,232), font, "FBDt"));
    add(new Widget(748, 300, 196, 70,
      "Flights By State", color(253,222,238), font, "FState"));
    add(new Widget(748, 370, 196, 70,
      "Cancelled Flights", color(134,207,190), font, "Cancelled"));
    add(new Widget(748, 440, 196, 70,
      "Delayed Flights", color(255,255,176), font, "Delays"));

    add(new Widget(850, 750, 100, 40,
      "Filters", color(255), font, "Filter"));
  }

  void draw() {
    //background(255, 212, 229);
    image(background, 0, 0, width, height);
    rect(552, 230, 391, 280);
    drawWidgets();
  }
}
