// S. Walsh, Implemented screens and widgets in main file, 22:00 26/03/2024
// S. Walsh, connected UI data filter to data arrays in program, 13:00, 08/04/2024
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
GPlot linePlot;


PImage background;
//Movie movie;
//Boolean enableVideo = false;
//ToggleBox toggleVideo;

String currentScreen = "Filter";
ScreenHome screenHome;
ScreenFBD screenFBD;
ScreenFDist screenFDist;
ScreenMShare screenMShare;
ScreenFilter screenFilter;
ScreenCancelled screenCancelled;
ScreenDelays screenDelays;
String[] dataSets = {"flights_full", "flights100k", "flights10k", "flights2k"};

ArrayList<DataPoint> data_full = new ArrayList<DataPoint>();
ArrayList<DataPoint> data100k = new ArrayList<DataPoint>();
ArrayList<DataPoint> data10k = new ArrayList<DataPoint>();
ArrayList<DataPoint> data2k = new ArrayList<DataPoint>();

ArrayList<DataPoint> selectedData = new ArrayList<DataPoint>();
ScreenFDates screenFDates;
ScreenFBS screenFBS;

PFont font;

void setup() {
  size(1000, 800);
  font = loadFont("AlNile-48.vlw");
  textFont(font, 20);
  Cutscreen cutScreen = new Cutscreen(8);
  cutScreen.draw();
  DataReader flights_full = new DataReader("flights_full.csv");
  cutScreen.draw();
  DataReader flights100k = new DataReader("flights100k.csv");
  cutScreen.draw();
  DataReader flights10k = new DataReader("flights10k.csv");
  cutScreen.draw();
  DataReader flights2k = new DataReader("flights2k.csv");
  cutScreen.draw();
  data_full = flights_full.readFile();
  cutScreen.draw();

  data100k = flights100k.readFile();
  cutScreen.draw();
  data10k = flights10k.readFile();
  cutScreen.draw();
  data2k = flights2k.readFile();
  cutScreen.draw();


  selectedData = data_full;

  textSize(14);


  screenHome = new ScreenHome(this);
  screenFBD = new ScreenFBD(this);
  screenFDist = new ScreenFDist(this);
  screenMShare = new ScreenMShare(this);
  screenFDates = new ScreenFDates(this);
  screenFBS = new ScreenFBS(this);
  screenCancelled = new ScreenCancelled(this);
  screenDelays = new ScreenDelays(this);


  //C. Quinn, created instance of the classes, 11:30, 29/03/2024
  background = loadImage("background.PNG");
  screenFilter = new ScreenFilter(this);
  slider = new SliderWidget(width - 650, width - 100, 80, color(244, 144, 185), 31, 5095, "Distance");
  pages = new ScrollWidget(50, 425, 400, 250, "Select Airport");
  checkBoxesAirlines = new CheckBox(50, 50, 10, color(244, 144, 185), "Airlines", screenFBD.airlines[1], true, false);
  checkBoxesDataSet = new CheckBox(width-400, 400, 4, color(244, 144, 185), "Data Set", dataSets, false, false);


  //movie = new Movie(this, "movie.mp4");
  //movie.loop();
  //movie.volume(0);
  //toggleVideo =  new ToggleBox(100, height - 60, 100, 40, "Toggle Video", color(255, 0, 0), font, "Toggle Video", color(0, 255, 0));
  rectMode(CORNER);
}

void draw() {

  switch(currentScreen) {
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
  case "FBDt":
    {
      screenFDates.draw();
      break;
    }
  case "FState":
    {
      screenFBS.draw();
      break;
    }
  case "Cancelled":
    {
      screenCancelled.draw();
      break;
    }
  case "Delays" :
    {
      screenDelays.draw();
      break;
    }
  default:
    {
      screenHome.draw();
      break;
    }
  }
  //if (movie.available() && enableVideo) {
  //  movie.read();
  //}
  //if (enableVideo) {
  //  int movW = 200;
  //  int movH = 356;
  //  image(movie, width - movW, height - movH, movW, movH);
  //}
  //toggleVideo.draw();
}



void mousePressed() {
  String event;

  screenFilter.mousePressed();

  //if (toggleVideo.getEvent(mouseX, mouseY).equals("Toggle Video")) {
  //  toggleVideo.toggle();
  //  enableVideo = !enableVideo;
  //  if (enableVideo) movie.volume(100);
  //  else movie.volume(0);
  //}

  switch(currentScreen) {
  case "Home":
    {
      ArrayList myWidgets = screenHome.getWidgets();
      for (int i= 0; i < myWidgets.size(); i++) {
        Widget theWidget = (Widget)myWidgets.get(i);
        event = theWidget.getEvent(mouseX, mouseY);
        switch(event) {
        case "Filter":
          currentScreen = "Filter";
          return;
        case "FBD":
          currentScreen = "FBD";
          screenFBD.update();
          return;
        case "FDist":
          currentScreen = "FDist";
          screenFDist.update();
          return;
        case "MShare":
          currentScreen = "MShare";
          screenMShare.update();
          return;
        case "FBDt":
          {
            currentScreen = "FBDt";
            screenFDates.update();
            return;
          }
        case "FState":
          {
            currentScreen = "FState";
            screenFBS.update();
            return;
          }
        case "Cancelled":
          {
            currentScreen = "Cancelled";
            screenCancelled.update();
            return;
          }
        case "Delays":
          {
            currentScreen = "Delays";
            screenDelays.update();
            return;
          }
        default:
        }
      }
    }
  case "FBD" :
    {
      ArrayList myWidgets = screenFBD.getWidgets();
      for (int i= 0; i < myWidgets.size(); i++) {
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
      for (int i= 0; i < myWidgets.size(); i++) {
        Widget theWidget = (Widget)myWidgets.get(i);
        event = theWidget.getEvent(mouseX, mouseY);
        switch(event) {
        case "Home":

          // Set data set
          String currentDataSet = checkBoxesDataSet.getSelected().get(0);
          switch (currentDataSet) {
          case "flights_full":
            selectedData = data_full;
            break;
          case "flights100k":
            selectedData = data100k;
            break;
          case "flights10k" :
            selectedData = data10k;
            break;
          case "flights2k" :
            selectedData = data2k;
            break;
          default:
          }

          // TODO update so datais only read again if the filename has changed since last time
          // Filter distancess
          selectedData = Filter.distanceBetween(selectedData, slider.getBounds()[0], slider.getBounds()[1]);
          println(selectedData.size());

          // Filter airlines
          ArrayList<String> airlines = checkBoxesAirlines.getSelected();
          for (int k = 0; k < airlines.size(); k++) {
            for (int j = 0; j < screenFBD.airlines[0].length; j++) {
              if (screenFBD.airlines[1][j].equals(airlines.get(k))) {
                airlines.set(k, screenFBD.airlines[0][j]);
              }
            }
          }
          selectedData = Filter.onlySelectAirlines(selectedData, airlines);

          // Filter airports
          ArrayList<String> airports = airportChecks.getSelected();
          selectedData = Filter.onlySelectAirports(selectedData, airports);

          // Filter dates

          selectedData = Filter.dateBetween(selectedData, parseInt(startDateInput.getText()), parseInt(endDateInput.getText()));


          currentScreen = "Home";
          return;
        default:
        }
      }
      slider.mousePressed(mouseX, mouseY);
      checkBoxesAirlines.mousePressed(mouseX, mouseY);
      checkBoxesDataSet.mousePressed(mouseX, mouseY);
      //airportChecks.mousePressed(mouseX, mouseY);
      //pages.mousePressed(mouseX, mouseY);
    }
  case "FDist":
    {
      ArrayList myWidgets = screenFDist.getWidgets();
      for (int i= 0; i < myWidgets.size(); i++) {
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
      for (int i= 0; i < myWidgets.size(); i++) {
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

  case "Cancelled":
    {
      ArrayList myWidgets = screenCancelled.getWidgets();
      for (int i= 0; i < myWidgets.size(); i++) {
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
  case "Delays":
    {
      ArrayList myWidgets = screenDelays.getWidgets();
      for (int i= 0; i < myWidgets.size(); i++) {
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
  case "FBDt":
    {
      ArrayList myWidgets = screenFDates.getWidgets();
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

// C. Quinn, added mouse wheel function to add scroll functionality to airpot slection, 3:30pm, 03/04/2024
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  airportChecks.needMouseWheel(e);
}
void keyPressed() {
  screenFilter.keyPressed();
}
