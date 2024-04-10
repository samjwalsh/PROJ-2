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
  // 2D array, one to declare all the States, the other is used to determine if duplicates occur and then deals with them later in code.

  BarChart barChart;
  ScreenFBS(PApplet parent) {
    super(parent);

    Table table = query.flightsByState(selectedData);

    barChart = new BarChart(parent, 740, 0, 0, "State"); // title , size , x ,  y
    barChart.setData(table, "Flights by State", "State", "Flights")  ;
  }
  void update() {
    Table table = query.flightsByState(selectedData);
    barChart.setData(table, "Flights by State", "State", "Flights");
  }
  void draw() {
    background(255, 212, 229);
    drawWidgets();
    barChart.draw();
    add(new Widget(50, 20, 100, 40,
      "Home", color(255), font, "Home"));        // Home button to go back
  }

  void toggleState(String state) {
    for (int i = 0; i < States[0].length; i++) {
      if (States[0][i].equals(state)) {
        if (States[1][i].equals("t")) {
          States[1][i] = "f";            // Determines if duplicates have occured and ensures none get passed to the table
        } else {
          States[1][i] = "t";
          ArrayList<String> allowedStates = new ArrayList<String>();
          for (int j = 0; j < States[0].length; j++) {
            if (States[1][j].equals("t")) allowedStates.add(States[0][j]); // if no duplicates occur, add current state to the allowed states ArrayList
          }
          ArrayList<DataPoint> filteredData;
          filteredData = Filter.onlySelectStates(selectedData, allowedStates);
          Table table = query.flightsByState(filteredData);
          barChart.setData(table, "Flights by State", "State", "Flights");  // calls BarChart class using the data that was generated in the query class.
          return;
        }
      }
    }
  }
}
