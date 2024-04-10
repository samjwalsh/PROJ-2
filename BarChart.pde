// S. Walsh, skeleton for bar chart class, 11:00, 21/03/2024
// Table argument must be in following format
/*
 Day,Flights
 Mon,401
 Tue,339
 Wed,339
 Thu,191
 Fri,0
 Sat,336
 Sun,393
 */


//barchart class made by ben bryce 2:00 tuesday 26 march 26/03/2024

class BarChart {
  int x;
  int y;
  //int bWidth;
  String chartTitle;
  GPlot plot;
  float barGap;

  BarChart(PApplet parent, int size, int positionX, int positionY, String title) {


    x = positionX;
    y = positionY;
    plot = new GPlot(parent); // connects to data from setup and main (i.e. screen size)
    plot.setPos(x, y);
    if (title.equals("State")) {
      plot.setDim(size+260, size);
    } else {
      plot.setDim(size, size);  // size+300, size
    }
    rectMode(CORNER);
  }

  void setData(Table table, String chartTitle, String headerOne, String headerTwo ) {


    GPointsArray points = new GPointsArray();

    //takes data from table and converts it into grafica points
    for (int i = 0; i < table.getRowCount(); i++)
    {
      TableRow row = table.getRow(i);
      String category = row.getString(row.getColumnTitle(0));
      float value = row.getFloat(row.getColumnTitle(1));

      points.add(new GPoint(i, value, category));
    }
    //grafica points take in data point and label
    plot.setPoints(points);


    plot.startHistograms(GPlot.VERTICAL); //turns graph type to histogram
    plot.getHistogram().setDrawLabels(true);
    plot.getHistogram().setBgColors(new int[] {color(100, 120, 220)});
    plot.getTitle().setText(chartTitle);


    float maxOfY = 0;
    for (int i = 0; i < points.getNPoints(); i++) {

      if (points.getY(i) > maxOfY)
      {
        maxOfY = points.getY(i);
      }
      //finds max barchart height
      plot.setYLim(0, 1.1 * maxOfY); // makes graph makes height 1.1 times the heighest point
      plot.getYAxis().setAxisLabelText(headerTwo);
      plot.getXAxis().setAxisLabelText(headerOne);
    }
  }

  void draw() {

    // Draw the plot
    plot.beginDraw(); //draws graph
    //plot.drawBackground();
    plot.drawBox();
    //plot.drawXAxis();
    plot.drawYAxis();
    plot.drawTitle();
    plot.drawHistograms();
    plot.endDraw();
  }
}
