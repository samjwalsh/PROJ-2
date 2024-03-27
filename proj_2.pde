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
  }
}
