// S. Walsh, Implemented screens and widgets in main file, 22:00 26/03/2024
import java.util.Calendar;
import java.text.SimpleDateFormat;
import grafica.*;
import java.util.Random;
import javax.swing.JOptionPane;

import processing.video.*;

Histogram theHistogram;
GPlot histogram;
Query query = new Query();
Filter Filter = new Filter();

Movie movie;
Boolean enableVideo = false;
ToggleBox toggleVideo;

String currentScreen = "Home";
ScreenHome screenHome;
ScreenFBD screenFBD;
ScreenFDist screenFDist;
ScreenMShare screenMShare;

ScreenFBS screenFBS;

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
  screenFBS = new ScreenFBS(this);

  movie = new Movie(this, "movie.mp4");
  movie.loop();
  movie.volume(0);
  toggleVideo =  new ToggleBox(100, height - 60, 100, 40, "Toggle Video", color(255, 0, 0), font, "Toggle Video", color(0, 255, 0));
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
  case "FState":
    {
      screenFBS.draw();
      break;
    }
  default:
    {
      screenHome.draw();
      break;
    }
  }
  if (movie.available() && enableVideo) {
    movie.read();
  }
  if (enableVideo) {
    int movW = 200;
    int movH = 356;
    image(movie, width - movW, height - movH, movW, movH);
  }
  toggleVideo.draw();
}

void mousePressed() {
  String event;

  if (toggleVideo.getEvent(mouseX, mouseY).equals("Toggle Video")) {
    toggleVideo.toggle();
    enableVideo = !enableVideo;
    if (enableVideo) movie.volume(100);
    else movie.volume(0);
  }

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
        case "MShare":
          {
            currentScreen = "MShare";
            return;
          }
        case "FState":
          {
            currentScreen = "FState";
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
          currentScreen = "Home";
          return;
        default:
        }
      }
    }
  case "FState":
    {
      ArrayList myWidgets = screenFBS.getWidgets();
      for (int i = 0; i < myWidgets.size(); i++) {
        Widget theWidget = (Widget)myWidgets.get(i);
        event = theWidget.getEvent(mouseX, mouseY);
        switch(event) {
        case "AK":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "AL":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "AR":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "AZ":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "CA":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "CO":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "CT":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "DE":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "FL":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "GA":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "HI":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "IA":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "ID":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "IL":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "IN":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "KS":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "KY":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "LA":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "MA":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "MD":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "ME":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "MI":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "MN":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "MO":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "MS":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "MT":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "NC":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "ND":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "NE":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "NH":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "NJ":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "NM":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "NV":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "NY":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "OH":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "OK":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "OR":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "PA":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "RI":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "SC":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "SD":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "TN":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "TX":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "UT":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "VA":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "VT":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "WA":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "WI":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "WV":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "WY":
          theWidget.toggle();
          screenFBS.toggleState(event);
          return;
        case "Home":
          currentScreen = "Home";
          return;
        default:
        }
      }
    }
  }
}
