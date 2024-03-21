import java.util.Calendar;
import java.text.SimpleDateFormat;
import grafica.*;
import java.util.Random;
import javax.swing.JOptionPane;

public GPlot histogram;
public GPointsArray samplePoints;
Query query = new Query();
Filter newFilter = new Filter();
void setup() {
    size(1000, 660);
  DataReader dataReader = new DataReader("flights2k.csv");
  ArrayList<DataPoint> data = dataReader.readFile();
  println(data.size());
  //String airport = JOptionPane.showInputDialog("Enter Airport");
  String airport = "JFK";
  //data = newFilter.isLateLeaving(data);
  int[] flightDistances = query.flightDistances(data, airport);
  Table table = query.flightsByDoW(data);
  saveTable(table, "data/new.csv");
}

void draw() {
}
