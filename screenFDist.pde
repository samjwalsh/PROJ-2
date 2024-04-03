// S. Walsh, Created screen class for showing flights by distance, 22:00 26/03/2024

class ScreenFDist extends Screen {
  Histogram histogram;
  ScreenFDist(PApplet parent) {
    super(parent);
    add(new Widget(100, 20, 100, 40,
      "Home", color(255), font, "Home"));

    int[] flightDistances = query.flightDistancesAllData(selectedData);
    histogram = new Histogram(250, 10, 600, 600, parent);
    histogram.setData(flightDistances, "Flights", "Distance Flown", "Number of Flights");
  }
  void update() {
    int[] flightDistances = query.flightDistancesAllData(selectedData);
    histogram.setData(flightDistances, "Flights", "Distance Flown", "Number of Flights");
  }
  void draw() {
    background(120, 0, 255);
    drawWidgets();
    histogram.draw();
  }
}
