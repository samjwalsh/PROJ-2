import java.util.Calendar;
import java.text.SimpleDateFormat;
import grafica.*;
import java.util.Random;
import javax.swing.JOptionPane;

Histogram theHistogram;
GPlot histogram;
Query query = new Query();
Filter Filter = new Filter();

String currentScreen = "Home";
ScreenHome screenHome;
ScreenFBD screenFBD;
ScreenFDist screenFDist;

ArrayList<DataPoint> data = new ArrayList<DataPoint>();
PFont font;
void setup() {
  size(1000, 800);
  font = createFont("", 99);
  DataReader dataReader = new DataReader("flights_full.csv");
  data = dataReader.readFile();

  screenHome = new ScreenHome(this);
  screenFBD = new ScreenFBD(this);
  screenFDist = new ScreenFDist(this);
}

void draw() {

  switch (currentScreen) {
  case "Home":
    {
      screenHome.draw();
      break;
    }
  case "FBD":
    {
      screenFBD.draw();
      break;
    }
    case "FDist": {
      screenFDist.draw();
      break;
    }
  default:
    {
      screenHome.draw();
      break;
    }
  }
}

void mousePressed() {
  String event;
  switch (currentScreen) {
  case "Home":
    {
      ArrayList myWidgets = screenHome.getWidgets();
      for (int i = 0; i < myWidgets.size(); i++) {
        Widget theWidget = (Widget)myWidgets.get(i);
        event = theWidget.getEvent(mouseX, mouseY);
        switch(event) {
        case "FBD":
          currentScreen = "FBD";
          return;
        case "FDist":
          currentScreen = "FDist";
          return;
        default:
        }
      }
    }
  case "FBD" :
    {
      ArrayList myWidgets = screenFBD.getWidgets();
      for (int i = 0; i < myWidgets.size(); i++) {
        Widget theWidget = (Widget)myWidgets.get(i);
        event = theWidget.getEvent(mouseX, mouseY);
        switch(event) {
        case "AA":
          theWidget.toggle();
          screenFBD.toggleAirline(event);
          return;
        case "AS":
          theWidget.toggle();
          screenFBD.toggleAirline(event);
          return;
        case "B6":
          theWidget.toggle();
          screenFBD.toggleAirline(event);
          return;
        case "DL":
          theWidget.toggle();
          screenFBD.toggleAirline(event);
          return;
        case "F9":
          theWidget.toggle();
          screenFBD.toggleAirline(event);
          return;
        case "G4":
          theWidget.toggle();
          screenFBD.toggleAirline(event);
          return;
        case "HA":
          theWidget.toggle();
          screenFBD.toggleAirline(event);
          return;
        case "NK":
          theWidget.toggle();
          screenFBD.toggleAirline(event);
          return;
        case "UA":
          theWidget.toggle();
          screenFBD.toggleAirline(event);
          return;
        case "WN":
          theWidget.toggle();
          screenFBD.toggleAirline(event);
          return;
        case "Home":
          currentScreen = "Home";
          return;
        default:
        }
      }
    }
  case "FDist":
    {
      ArrayList myWidgets = screenFDist.getWidgets();
      for (int i = 0; i < myWidgets.size(); i++) {
        Widget theWidget = (Widget)myWidgets.get(i);
        event = theWidget.getEvent(mouseX, mouseY);
        switch(event) {
        case "Home":
          currentScreen = "Home";
          return;
        default:
        }
      }
    }
  }
}
