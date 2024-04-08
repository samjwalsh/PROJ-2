// M.Murphy, LinePlot class created to create and draw a Line Plot for flight dates, 23:00, 03/04/2024

public static int JAN_DAYS = 31;

class LinePlot {
  int x;
  int y;
  int pWidth;
  int pHeight;
  GPlot linePlot;
  GPointsArray pPoints;
  int[] data;
  int[] dataRange;
  String chartTitle;
  String xTitle;
  String yTitle;
  
  LinePlot(int x, int y, int pWidth, int pHeight, PApplet parent) {
    this.x = x;
    this.y = y;
    this.pWidth = pWidth;
    this.pHeight = pHeight;
    this.linePlot = new GPlot(parent);
  }
  
  void setData(int[] data, int[] dataRange, String chartTitle, String xTitle, String yTitle) {
    int max = dataRange[1]; int min = dataRange[0];
    int ticks = JAN_DAYS;
    String[] days = new String[ticks];
    for(int i = 0; i < ticks; i++) {
      if(i < 9) days[i] = "0"+String.valueOf(i+1);
      else days[i] = String.valueOf(i+1);
    }
    pPoints = new GPointsArray(ticks);
    int[] yHeights = new int[ticks];
    //println(data.length);
    for(int i = 0; i < data.length; i++) {
      yHeights[i] = data[i];  
      /*println(data[i]);*/ println(yHeights[i]);
    }
    println(data[0]);

    int maxHeight = 0;
    for(int i = 0; i < ticks; i++) {
      pPoints.add(i+1, yHeights[i]);
      if(maxHeight < yHeights[i]) maxHeight = yHeights[i];
    }   
    linePlot.setPos(x,y);
    linePlot.setDim(pWidth,pHeight);
    linePlot.setXLim(min,max);
    linePlot.setYLim(0,maxHeight+(int)maxHeight/10);
    linePlot.getTitle().setText(chartTitle);
    linePlot.getXAxis().getAxisLabel().setText(xTitle);
    linePlot.getYAxis().getAxisLabel().setText(yTitle);
    linePlot.setPoints(pPoints);
    
  }
  
  public void draw() {
    linePlot.beginDraw();
    linePlot.drawBox();
    linePlot.drawXAxis();
    linePlot.drawYAxis();
    linePlot.drawTitle();
    linePlot.drawPoints();
    linePlot.drawLines();  
    linePlot.endDraw();
  }
  
  
}
