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
  
  Histogram(int x, int y, int hWidth, int hHeight, PApplet parent) {
    this.x = x;
    this.y = y;
    this.hWidth = hWidth;
    this.hHeight = hHeight;
    this.histogram = new GPlot(parent);
  }
  
  // Takes data chosen based on filters and creates a histogram that takes the datapoints in corresponding ranges to increase the height of the bars in the histogram.
  // The ranges are based on the maximum value divided by a set number of buckets.
  void setData(int[] data, String chartTitle, String xTitle, String yTitle) {
    float min = 0; float max = 0;
    for(int i = 0; i<data.length; i++) {
      if(data[i]>max) max = data[i];
    }
    max = (int)(Math.ceil(max/100)*100);
    int buckets = 20;
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
    float[] ticks = new float[buckets+1];
    for(int i = 0; i < ticks.length; i++) {
      ticks[i] = (max/buckets)*i;  
    }
     
    histogram.setPos(x,y);
    histogram.setDim(hWidth,hHeight);
    histogram.setXLim(min,max);
    histogram.setYLim(min,maxBarHeight+(int)maxBarHeight/10);
    histogram.getTitle().setText(chartTitle);
    histogram.getXAxis().getAxisLabel().setText(xTitle);
    histogram.getYAxis().getAxisLabel().setText(yTitle);
    histogram.getXAxis().setTicks(ticks);
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
    histogram.drawTitle();
    histogram.drawHistograms();
    histogram.endDraw();
  }
}
