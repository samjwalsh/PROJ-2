// S. Walsh, Created screen class for showing flights by day of week, 22:00 26/03/2024

class ScreenFBD extends Screen {
  String[][] airlines = new String[][]{{
    "AA", "AS", "B6", "DL", "F9", "G4", "HA", "NK", "UA", "WN"},
    {"American Airlines", "Alaska Airlines", "Jet Blue", "Delta Airlines", "Frontier Airlines", "Allegiant Air", "Hawaiian Airlines", "Spirit Airlines", "United Airlines", "Southwest Airlines"},
    {"t", "t", "t", "t", "t", "t", "t", "t", "t", "t"}
  };
  BarChart barChart;
  ScreenFBD(PApplet parent) {
    super(parent);

    Table table = query.flightsByDoW(selectedData);

    barChart = new BarChart(parent, 700, width - 800, 0, "date");
    barChart.setData(table, "Flights by day of week", "Day", "Flights")  ;

    add(new Widget(100, 20, 100, 40,
      "Home", color(255), font, "Home"));


    int initX = 50;
    int initY = 100;
    //textAlign(CENTER);
    //rectMode(CENTER);
    for (int i = 0; i < airlines[0].length; i++) {
      add(new ToggleBox(initX, initY, 150, 40,
        airlines[1][i], color(173, 245, 185), font, airlines[0][i], color(245, 173, 173)));
      initY += 50;
    }
  }
  void update() {
    Table table = query.flightsByDoW(selectedData);
    barChart.setData(table, "Flights by day of week", "Day", "Flights")  ;
  }
  void draw() {
    background(221, 212, 232);
    drawWidgets();
    barChart.draw();
  }
  void toggleAirline (String airline) {
    for (int i = 0; i < airlines[0].length; i++) {
      if (airlines[0][i].equals(airline)) {
        if (airlines[2][i].equals("t")) {
          airlines[2][i] = "f";
        } else {
          airlines[2][i] = "t";
        }

        ArrayList<String> allowedAirlines = new ArrayList<String>();
        for (int j = 0; j < airlines[0].length; j++ ) {
          if (airlines[2][j].equals("t")) allowedAirlines.add(airlines[0][j]);
        }
        ArrayList<DataPoint> filteredData;
        filteredData = Filter.onlySelectAirlines(selectedData, allowedAirlines);
        Table table = query.flightsByDoW(filteredData);
        barChart.setData(table, "Flights by day of week", "Day", "Flights");

        return;
      }
    }
  }
}
