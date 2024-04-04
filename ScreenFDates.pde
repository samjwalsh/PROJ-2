// M.Murphy, cated screen class for showing flights by dates, 6:00, 04/04/2024

class ScreenFDates extends Screen {
  LinePlot linePlot;
  ScreenFDates(PApplet parent) {
    super(parent);
    add(new Widget(100, 20, 100, 40,
      "Home", color(255), font, "Home"));
      
  Query.DatesInRange datesInRange;
  int[] range = {1,6}; // change range here
  datesInRange =  query.flightsByDate(data, range);
  
  linePlot = new LinePlot(250, 10, 600, 600, parent);
  linePlot.setData(datesInRange.dates, datesInRange.range, "FLights By Date", "Date", "Number of Flights");
  }
  void draw() {
    background(120, 0, 255);
    drawWidgets();
    linePlot.draw();
  }
}
