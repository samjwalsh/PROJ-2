// S. Walsh, skeleton for pie chart class, 11:00, 21/03/2024
// Mitchell Ashmore filled pie chart class 24/3/2024
// S. Walsh, Simplified calculation of degrees and addred percentage calculations, 12:00, 28/03/2024


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

class PieChart {
  int x;
  int y;
  int hWidth;
  int hHeight;
  float[] values;        // was int[]
  String[] labels;      // was int[]
  float diameter;
  String chartTitle;
  String xTitle;
  String yTitle;
  float legendWidth;
  float legendHeight;
  float legendX;
  float legendY;
  float totalVals;
  PieChart(int x, int y, int hWidth, int hHeight) {
    this.x = x;
    this.y = y;
    this.diameter = x;
    this.hWidth = hWidth;
    this.hHeight = hHeight;
  }

  void setData(Table table, String chartTitle) {
    values = new float[table.getRowCount()];
    labels = new String[table.getRowCount()];



    totalVals = 0;
    for (int i = 0; i < table.getRowCount(); i++) {
      values[i] = table.getInt(i, 1);

      totalVals += values[i];
      //println(totalVals);
    }
    for (int i = 0; i < table.getRowCount(); i++) {
      labels[i] = table.getString(i, 0);
    }

    //println(Arrays.toString(values));
    //println(Arrays.toString(labels));
  }

  void draw() {
    float legendWidth = 200;
    float legendHeight = values.length * 30;
    float legendX = width - legendWidth - 100;
    float legendY = (height - legendHeight) / 2;
    background(255); 

    textAlign(CENTER);
    textSize(30);
    fill(0);
    text("Market Share per Airline", width / 2, 30);
    textAlign(LEFT);

      colorMode(HSB, 360, 100, 100);

    float lastAngle = 0;
    float sat = 65;
    float bri = 100;
    for (int i = 0; i < values.length; i++) {
      float hue = ((float)(i+1)/(float)values.length)*360;
      println(i);
      println(hue);
      color colour = color(hue, sat, bri);
      fill(colour);
      float newAngle = radians((values[i] * 360 )/(totalVals));
      arc(width/2 - 100, height/2, diameter, diameter, lastAngle, lastAngle + newAngle);

      textSize(12);
      fill(colour);
      rect(legendX, legendY, 30, 30);
      fill(0);
      text(labels[i], legendX + 45, legendY + 20);
      legendY += 30;
      lastAngle += newAngle;
    }
    colorMode(RGB, 255,255,255);

  }
}
