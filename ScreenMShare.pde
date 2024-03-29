// S. Walsh, Created screen class for pie chart, 22:00 26/03/2024
class ScreenMShare extends Screen {
  PieChart pieChart;

  ScreenMShare(PApplet parent) {
    super(parent);
    add(new Widget(100, 20, 100, 40,
      "Home", color(255), font, "Home"));

    Table table = query.marketShare(data);
    pieChart = new PieChart(height/2, width/2, 50, 50);
    pieChart.setData(table, "MarketShare");
  }

  void draw() {
    background(120, 0, 255);

    pieChart.draw();
    drawWidgets();
  }
}
