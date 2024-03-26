// S. Walsh, skeleton for histogram class, 11:00, 21/03/2024
// M. Murphy, Histogram class completed for distances, 19:00, 26/03/2024

class Histogram {
  int x;
  int y;
  int hWidth;
  int hHeight;
  GPlot histogram;
  GPointsArray hPoints;
  int[] data;
  String chartTitle;
  String xTitle;
  String yTitle;
  
  Histogram(int x, int y, int hWidth, int hHeight, GPlot histogram) {
    this.x = x;
    this.y = y;
    this.hWidth = hWidth;
    this.hHeight = hHeight;
    this.histogram = histogram;
  }
  
  void setData(int[] data, String chartTitle, String xTitle, String yTitle) {
    float min = 0; float max = 0;
    for(int i = 0; i<data.length; i++) {
      if(data[i]>max) max = data[i];
    }
    max = (int)(Math.ceil(max/1000)*1000);
    int buckets = 0;
    if((max/1000) % 2 == 1) buckets = 5;
    else buckets = 4;
    float interval = (int)(max/buckets);
    int[] barHeights = new int[buckets];
    hPoints = new GPointsArray(buckets);
    for(int i = 0; i<data.length; i++) {
      for(int j = 0; j < buckets; j++) {
        if(data[i]<=interval+(interval*j)) {
          barHeights[j] += 1;
          break;
        }
      }
    }
    int maxBarHeight = 0;
    for(double i = 0; i < barHeights.length; i++) {
      hPoints.add((int)(max*((i+(i+1.0))/(buckets*2))),barHeights[(int)i]);  
    }
    for(int i= 0; i < buckets; i++) {
      if(barHeights[i] > maxBarHeight) maxBarHeight = barHeights[i];
    }
     
    histogram.setPos(x,y);
    histogram.setDim(hWidth,hHeight);
    histogram.setXLim(min,max);
    histogram.setYLim(min,maxBarHeight);
    histogram.getTitle().setText(chartTitle);
    histogram.getXAxis().getAxisLabel().setText(xTitle);
    histogram.getYAxis().getAxisLabel().setText(yTitle);    
    histogram.setPoints(hPoints);
    histogram.setHistType(GPlot.VERTICAL);
    histogram.setHistVisible(true);
    histogram.getHistogram();
    histogram.startHistograms(GPlot.VERTICAL);
  }
  
  void draw() {
    histogram.beginDraw();
    histogram.drawBackground();
    histogram.drawBox();
    histogram.drawXAxis();
    histogram.drawYAxis();
    histogram.drawXAxis();
    histogram.drawTitle();
    histogram.drawHistograms();
    histogram.endDraw();
  }
}
