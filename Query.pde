// S.Walsh, created query for creating int array of flight distances through a given airport, 11:00, 21/03/2024
// S.Walsh, created query for creating a table of flights by day of week, 11:00, 21/03/2024
// Mitchell Ashmore query for creating a table of market shares by Airlines, 12:30 21/3/2024
//Make a query based off marketShare using " MKT_CARRIER "


class Query {

  int[] flightDistances(ArrayList<DataPoint> data, String airport) {
    ArrayList<Integer> distancesAL = new ArrayList<Integer>();

    for (DataPoint dataPoint : data) {
      if (dataPoint.getOriginAirport().equals(airport)) {
        distancesAL.add(dataPoint.getDistance());
      }
    }

    println(distancesAL.size());

    int[] array = new int[distancesAL.size()];
    for (int i = 0; i < distancesAL.size(); i++ ) {
      array[i] = distancesAL.get(i);
    }


    return array;
  }

  Table flightsByDoW(ArrayList<DataPoint> data) {

    int mon = 0;
    int tue = 0;
    int wed = 0;
    int thu = 0;
    int fri = 0;
    int sat = 0;
    int sun = 0;

    for (DataPoint dataPoint : data) {
      Calendar c = Calendar.getInstance();
      try {
        c.setTime(new SimpleDateFormat("M/dd/yyyy").parse(dataPoint.getFlightDate()));
        int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);

        switch(dayOfWeek) {
        case 1:
          sun++;
          break;
        case 2:
          mon++;
          break;
        case 3:
          tue++;
          break;
        case 4:
          wed++;
          break;
        case 5:
          thu++;
          break;
        case 6:
          fri++;
          break;
        case 7:
          sat++;
          break;
        default:
          break;
        }
      }
      catch(Exception e) {
        //e.printStackTrace();
      }
    }

    Table table = new Table();
    table.addColumn("Day");
    table.addColumn("Flights");

    TableRow monRow = table.addRow();
    monRow.setString("Day", "Mon");
    monRow.setInt("Flights", mon);

    TableRow tueRow = table.addRow();
    tueRow.setString("Day", "Tue");
    tueRow.setInt("Flights", tue);

    TableRow wedRow = table.addRow();
    wedRow.setString("Day", "Wed");  // day  and flights = column title
    wedRow.setInt("Flights", wed);

    TableRow thuRow = table.addRow();
    thuRow.setString("Day", "Thu");
    thuRow.setInt("Flights", thu);

    TableRow friRow = table.addRow();
    friRow.setString("Day", "Fri");
    friRow.setInt("Flights", fri);

    TableRow satRow = table.addRow();
    satRow.setString("Day", "Sat");
    satRow.setInt("Flights", sat);

    TableRow sunRow = table.addRow();
    sunRow.setString("Day", "Sun");
    sunRow.setInt("Flights", sun);

    return table;
  }


  Table marketShare(ArrayList<DataPoint> data) {

    int AA = 0;
    int AS = 0;
    int B6 = 0;
    int DL = 0;
    int F9 = 0;
    int G4 = 0;
    int HA = 0;
    int NK = 0;
    int UA = 0;
    int WN = 0;

    for (DataPoint dataPoint : data) {
      //println("MARKET SHARE DATAPOINT:"+dataPoint.getAirlineCode());

      if (dataPoint.getAirlineCode().equals("AA")) {
        AA++;
        //println(AA);
      }
      if (dataPoint.getAirlineCode().equals("AS")) {
        AS++;
        //println(AS);
      }
      if (dataPoint.getAirlineCode().equals("B6")) {
        B6++;
        //println(B6);
      }
      if (dataPoint.getAirlineCode().equals("DL")) {
        DL++;
        //println(DL);
      }
      if (dataPoint.getAirlineCode().equals("F9")) {
        F9++;
        //println(F9);
      }
      if (dataPoint.getAirlineCode().equals("G4")) {
        G4++;
        //println(G4);
      }
      if (dataPoint.getAirlineCode().equals("HA")) {
        HA++;
        //println(HA);
      }
      if (dataPoint.getAirlineCode().equals("NK")) {
        NK++;
        //println(NK);
      }
      if (dataPoint.getAirlineCode().equals("UA")) {
        UA++;
        //println(UA);
      }
      if (dataPoint.getAirlineCode().equals("WN")) {
        WN++;
        //println(WN);
      }
    }

    Table tableTwo = new Table();
    tableTwo.addColumn("Airline");
    tableTwo.addColumn(" No. Flights ");

    TableRow AARow = tableTwo.addRow();
    AARow.setString("Airline", "American Airlines");
    AARow.setInt(" No. Flights ", AA);

    TableRow ASRow = tableTwo.addRow();
    ASRow.setString("Airline", "Alaska Airlines");
    ASRow.setInt(" No. Flights ", AS);

    TableRow B6Row = tableTwo.addRow();
    B6Row.setString("Airline", "Jet Blue");
    B6Row.setInt(" No. Flights ", B6);

    TableRow DLRow = tableTwo.addRow();
    DLRow.setString("Airline", "Delta Airlines");
    DLRow.setInt(" No. Flights ", DL);

    TableRow F9Row = tableTwo.addRow();
    F9Row.setString("Airline", "Frontier Airlines");
    F9Row.setInt(" No. Flights ", F9);

    TableRow G4Row = tableTwo.addRow();
    G4Row.setString("Airline", "Allegiant Air");
    G4Row.setInt(" No. Flights ", G4);

    TableRow HARow = tableTwo.addRow();
    HARow.setString("Airline", "Hawaiian Airlines");
    HARow.setInt(" No. Flights ", HA);

    TableRow NKRow = tableTwo.addRow();
    NKRow.setString("Airline", "Spirit Airlines");
    NKRow.setInt(" No. Flights ", NK);

    TableRow UARow = tableTwo.addRow();
    UARow.setString("Airline", "United Airlines");
    UARow.setInt(" No. Flights ", UA);

    TableRow WNRow = tableTwo.addRow();
    WNRow.setString("Airline", "Southwest Airlines");
    WNRow.setInt(" No. Flights ", WN);

    return tableTwo;
  }
}
