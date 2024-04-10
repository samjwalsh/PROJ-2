// M.Murphy, created screen class for showing flights by dates, 6:00, 04/04/2024

class ScreenFDates extends Screen {
  LinePlot linePlot;
  ScreenFDates(PApplet parent) {
    super(parent);
    add(new Widget(100, 20, 100, 40,
      "Home", color(255), font, "Home"));
  }
  
  void update() {
    Query.DatesInRange datesInRange;
    datesInRange =  query.flightsByDate(selectedData);

    linePlot = new LinePlot(250, 10, 600, 600, parent);
    linePlot.setData(datesInRange.dates, datesInRange.range, "FLights By Date", "Date", "Number of Flights");
  }
  void draw() {
    background(221,212,232);
    drawWidgets();
    linePlot.draw();
  }
}
