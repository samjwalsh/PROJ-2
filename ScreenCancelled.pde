// S. Walsh, Created screen class for cancelled flights, 22:00 26/03/2024
class ScreenCancelled extends Screen {
  PieChart pieChart;

  ScreenCancelled(PApplet parent) {
    super(parent);
    add(new Widget(100, 20, 100, 40,
      "Home", color(255), font, "Home"));

    Table table = query.cancelledFlights(selectedData);
    pieChart = new PieChart(height/2, width/2, 50, 50);
    pieChart.setData(table, "Cancelled Flights");
  }

  void update() {
    Table table = query.cancelledFlights(selectedData);
    pieChart.setData(table, "Cancelled Flights");
  }

  void draw() {
    background(120, 0, 255);

    pieChart.draw();
    drawWidgets();
  }
}
