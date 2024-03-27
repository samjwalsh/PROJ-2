// S. Walsh, Implemented screens and widgets in main file, 22:00 26/03/2024
import java.util.Calendar;
import java.text.SimpleDateFormat;
import grafica.*;
import java.util.Random;
import javax.swing.JOptionPane;

Histogram theHistogram;
GPlot histogram;
Query query = new Query();
Filter Filter = new Filter();

String currentScreen = "MShare";
ScreenHome screenHome;
ScreenFBD screenFBD;
ScreenFDist screenFDist;
ScreenMShare screenMShare;

ArrayList<DataPoint> data = new ArrayList<DataPoint>();
PFont font;
void setup() {
  size(1000, 800);
  font = createFont("", 99);
  DataReader dataReader = new DataReader("flights10k.csv");
  data = dataReader.readFile();

  screenHome = new ScreenHome(this);
  screenFBD = new ScreenFBD(this);
  screenFDist = new ScreenFDist(this);
  screenMShare = new ScreenMShare(this);
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
  case "FDist":
    {
      screenFDist.draw();
      break;
    }
  case "MShare":
    {
      screenMShare.draw();
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
        case "MShare": {
          currentScreen = "MShare";
          return;
        }
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
  case "MShare":
    {
      ArrayList myWidgets = screenMShare.getWidgets();
      for (int i = 0; i < myWidgets.size(); i++) {
        Widget theWidget = (Widget)myWidgets.get(i);
        event = theWidget.getEvent(mouseX, mouseY);
        switch(event) {
        case "Home":
        println("HB");
          currentScreen = "Home";
          return;
        default:
        }
      }
    }
  }
}
