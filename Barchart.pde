//ben bryyce 20 march 
//Barchart class for data types with two choices. I.e. planes cancelled vs uncancelled
import grafica.*;
class Barchart{
  
  GPlot plot; String titleText; String xLabel; String yLabel; final int BARWIDTH = 40;
  Barchart(PApplet parent,String titleText, int barchartOneHeight, int barchartTwoHeight, 
  String barchartOneLabel, String barchartTwoLabel, String xLabel, String yLabel)
  {
    int[] values = {barchartOneHeight, barchartTwoHeight}; 
    String[] labels = {barchartOneLabel, barchartTwoLabel}; 
    plot = new GPlot(parent);
    this.titleText = titleText;
    this.xLabel = xLabel;
    this.yLabel = yLabel;
    plot.setDim(300, 200);
    plot.setTitleText(titleText);
    plot.getXAxis().setAxisLabelText(xLabel);
    plot.getYAxis().setAxisLabelText(yLabel);
    
    
    GPointsArray points = new GPointsArray(values.length);
      for (int i = 0; i < values.length; i++) {
    float x = (i + 0.5) * BARWIDTH;
    points.add(x, values[i], labels[i]);
      }
      
    plot.setPoints(points);
    plot.startHistograms(GPlot.VERTICAL);
    plot.getHistogram().setBgColors(new int[] {color(255, 100, 100), color(100, 150, 255)});
  }
  
  void draw() {
  background(255);

  // Draw the plot
  plot.beginDraw();
  plot.drawBackground();
  plot.drawBox();
  plot.drawYAxis();
  plot.drawTitle();
  plot.drawHistograms();
  plot.endDraw();
}
}
