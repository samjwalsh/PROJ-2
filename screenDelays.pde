// S. Walsh, Created screen class for delayed flights, 22:00 26/03/2024
class ScreenDelays extends Screen {
  PieChart pieChart;

  ScreenDelays(PApplet parent) {
    super(parent);
    add(new Widget(100, 20, 100, 40,
      "Home", color(255), font, "Home"));

    Table table = query.delayedFlights(selectedData);
    pieChart = new PieChart(height/2, width/2, 50, 50);
    pieChart.setData(table, "Delays");
  }

  void update() {
    Table table = query.delayedFlights(selectedData);
    pieChart.setData(table, "Delays");
  }

  void draw() {
    background(221, 212, 232);

    pieChart.draw();
    drawWidgets();
  }
}
