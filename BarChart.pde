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
import grafica.*;


class BarChart {
  int x;
  int y;
  //int bWidth;
  String chartTitle;
  GPlot plot;
  
  BarChart(PApplet parent, int size, int positionX, int positionY) {
 
 
    x = positionX;
    y = positionY;
    plot = new GPlot(parent);
    plot.setPos(x, y);
    plot.setDim(size, size);

    
  }

  void setData(Table table, String chartTitle, String headerOne, String headerTwo ) {
    
     
    GPointsArray points = new GPointsArray();
    
  
    for (int i = 0; i < table.getRowCount(); i++)
    {
        TableRow row = table.getRow(i);
        String category = row.getString(headerOne);
        float value = row.getFloat(headerTwo);
        
        points.add(new GPoint(i, value, category));
    }
    
    plot.setPoints(points);


    plot.startHistograms(GPlot.VERTICAL);
    plot.getHistogram().setDrawLabels(true);
    plot.getHistogram().setBgColors(new int[] {color(100, 120, 220)});
    plot.getTitle().setText(chartTitle);
    
    
    float maxOfY = 0;
    for (int i = 0; i < points.getNPoints(); i++) {
  
    if (points.getY(i) > maxOfY)
    {
      maxOfY = points.getY(i);
    }
    
    plot.setYLim(0, maxOfY + 10);
    plot.getYAxis().setAxisLabelText(headerTwo);
    plot.getXAxis().setAxisLabelText(headerOne);
   
  }
  }

  void draw() {

  // Draw the plot
  plot.beginDraw();
  //plot.drawBackground();
  plot.drawBox();
  //plot.drawXAxis();
  plot.drawYAxis();
  plot.drawTitle();
  plot.drawHistograms();
  plot.endDraw();
  }
}

