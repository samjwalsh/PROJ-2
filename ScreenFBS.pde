// Mitchell Ashmore, Created screen class for showing flights by state, 31/03/2024

class ScreenFBS extends Screen {
  String [][] States = new String[][]{
    {"AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME"
      , "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA"
    , "WI", "WV", "WY"},
    {"t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t"
    , "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t"}
    }
    ;

  BarChart barChart;
  ScreenFBS(PApplet parent) {
    super(parent);

    Table table = query.flightsByState(data);

    barChart = new BarChart(parent, 700, width - 800, 0);
    barChart.setData(table, "Flights by State", "State", "Flights")  ;

    add(new Widget(100, 20, 100, 40,
      "Home", color(255), font, "Home"));


    int initX = 20;
    int initY = 70;
    for (int i = 0; i < States[0].length; i++) {
      add(new ToggleBox(initX, initY, 20, 40,
        States[0][i], color(0, 255, 0), font, States[0][i], color(255, 0, 0)));
      if (initY >= 600) {
        initX += 50;
        initY = 20;
      }

      initY += 50;
    }
  }
  void draw() {
    background(200);
    drawWidgets();
    barChart.draw();
  }

  void toggleState(String state) {
    for (int i = 0; i < States[0].length; i++) {
      if (States[0][i].equals(state)) {
        if (States[1][i].equals("t")) {
          States[1][i] = "f";
        } else {
          States[1][i] = "t";
        }

        ArrayList<String> allowedStates = new ArrayList<String>();
        for (int j = 0; j < States[0].length; j++) {
          if (States[1][j].equals("t")) allowedStates.add(States[0][j]);
        }
        ArrayList<DataPoint> filteredData;
        filteredData = Filter.onlySelectStates(data, allowedStates);
        Table table = query.flightsByState(filteredData);
        barChart.setData(table, "Flights by State", "State", "Flights");
        return;
      }
    }
  }
}
