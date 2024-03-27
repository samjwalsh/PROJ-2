// S. Walsh, skeleton for pie chart class, 11:00, 21/03/2024
// Mitchell Ashmore filled pie chart class 24/3/2024
import java.util.Arrays;


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
  String chartTitle;
  String xTitle;
  String yTitle;
  float legendWidth;
  float legendHeight;
  float legendX;
  float legendY;
  PieChart(int x, int y, int hWidth, int hHeight) {
    this.x = x;
    this.y = y;
    this.hWidth = hWidth;
    this.hHeight = hHeight;
  }

  void setData(Table table, String chartTitle) {
    values = new float[table.getRowCount()];
    labels = new String[table.getRowCount()];
    float degreesEach = (float(360) / float(2000));
    //println("degrees each"+degreesEach);

    for (int i = 0; i < table.getRowCount(); i++) {
      values[i] = degreesEach * table.getInt(i, 1);
    }
    for (int i = 0; i < table.getRowCount(); i++) {
      labels[i] = table.getString(i, 0);
    }
    println(Arrays.toString(values));
    println(Arrays.toString(labels));

    pieChart(500, values, labels);
  }

  void pieChart(float diameter, float[] flightCount, String[] airlines) {
    float legendWidth = 200;
    float legendHeight = flightCount.length * 30;
    float legendX = width - legendWidth - 100;
    float legendY = (height - legendHeight) / 2;
    background(255);

    textAlign(CENTER);
    textSize(30);
    fill(0);
    text("Market Share per Airline", width/2, 30);


    float lastAngle = 0;
    for (int i = 0; i < flightCount.length; i++) {
      float currentR = random(255);
      float currentG = random(255);
      float currentB = random(255);
      fill(currentR, currentG, currentB);
      arc(width/2 - 100, height/2, diameter, diameter, lastAngle, lastAngle+radians(flightCount[i]));

      textSize(12);
      fill(currentR, currentG, currentB);
      rect(legendX, legendY, 30, 30);
      fill(0);
      text(airlines[i], legendX + 100, legendY + 20);
      legendY += 30;
      lastAngle += radians(flightCount[i]);
    }
  }


  void draw() {
  }
}
