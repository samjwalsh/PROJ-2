// S. Walsh, Implemented screens and widgets in main file, 22:00 26/03/2024
import java.util.Calendar;
import java.text.SimpleDateFormat;
import grafica.*;
import java.util.Random;
import javax.swing.JOptionPane;

import processing.video.*;
import java.util.ArrayList;
import java.util.HashSet;
import processing.data.Table;
import processing.data.TableRow;
import java.util.Collections;

Histogram theHistogram;
GPlot histogram;
Query query = new Query();
Filter Filter = new Filter();
SliderWidget slider;
CheckBox checkBoxesAirlines;
CheckBox checkBoxesDataSet;
CheckBox airportChecks;
ScrollWidget pages;
InputBox startDateInput;
InputBox endDateInput;

PImage background;
Movie movie;
Boolean enableVideo = false;
ToggleBox toggleVideo;

String currentScreen = "Home";
ScreenHome screenHome;
ScreenFBD screenFBD;
ScreenFDist screenFDist;
ScreenMShare screenMShare;
ScreenFilter screenFilter;
String[] dataSets={"flights_full", "flights_100k", "flights10k", "flights2k"};

ArrayList<DataPoint> data = new ArrayList<DataPoint>();
PFont font;

void setup() {
  size(1000, 800);
  font = loadFont("Helvetica-48.vlw");
  textFont(font,20);
  DataReader dataReader = new DataReader("flights10k.csv");
  data = dataReader.readFile();
  
  screenHome = new ScreenHome(this);
  screenFBD = new ScreenFBD(this);
  screenFDist = new ScreenFDist(this);
  screenMShare = new ScreenMShare(this);
  

  // C. Quinn, created instance of the classes, 11:30, 29/03/2024
  background = loadImage("background.PNG");
  screenFilter = new ScreenFilter(this);
  slider = new SliderWidget(width-650, width-100, 80, color(244, 144, 185), 31, 5095, "Distance");
  pages = new ScrollWidget(50, 425, 400, 250, "Select Airport");
  checkBoxesAirlines = new CheckBox(50, 50, 10, color(244, 144, 185), "Airlines", screenFBD.airlines[1], true);
  checkBoxesDataSet = new CheckBox(width-400, 400, 4, color(244, 144, 185), "Data Set", dataSets, false);

  movie = new Movie(this, "movie.mp4");
  movie.loop();
  movie.volume(0);
  toggleVideo =  new ToggleBox(100, height - 60, 100, 40, "Toggle Video", color(255, 0, 0), font, "Toggle Video", color(0, 255, 0));
  rectMode(CORNER);
}

void draw() {

  switch (currentScreen) {
  case "Home":
    {
      screenHome.draw();
      break;
    }
  case "Filter":
    {
      screenFilter.draw();
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
  
   screenFilter.mousePressed();

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
        case "Filter":
          currentScreen = "Filter";
          return;
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
  case "Filter":
    {
      ArrayList myWidgets = screenFilter.getWidgets();
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
      slider.runMousePressed(mouseX, mouseY);
      checkBoxesAirlines.runMousePressed(mouseX, mouseY);
      checkBoxesDataSet.runMousePressed(mouseX, mouseY);
      airportChecks.runMousePressed(mouseX, mouseY);
      pages.needMousePressed(mouseX, mouseY);
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

// C. Quinn, added mouse wheel function to add scroll functionality to airpot slection, 3:30pm, 03/04/2024
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  pages.needMouseWheel(e);
}
void keyPressed() {
  screenFilter.keyPressed();
}
