// S.Walsh, created query for creating int array of flight distances through a given airport, 11:00, 21/03/2024
// S.Walsh, created query for creating a table of flights by day of week, 11:00, 21/03/2024

//Make a query based off marketShare using " MKT_CARRIER "
// Each MKT_CARRIER has a 2 digit abbreviation, find out abbreviation and match to carrier
//Pie chart ?? showing this data

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
    wedRow.setString("Day", "Wed");
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
}
void marketShare(DataPoint dataPoint) {
  int AA=0;
  int AS=0;
  int B6=0;
  int DL=0;
  int F9=0;
  int G4=0;
  int HA=0;
  int NK=0;
  int UA=0;
  int WN=0;


  if (dataPoint.getAirlineCode() == "AA") {
    AA++;
  }
  if (dataPoint.getAirlineCode() == "AS") {
    AS++;
  }
  if (dataPoint.getAirlineCode() == "B6") {
    B6++;
  }
  if (dataPoint.getAirlineCode() == "DL") {
    DL++;
  }
  if (dataPoint.getAirlineCode() == "F9") {
    F9++;
  }
  if (dataPoint.getAirlineCode() == "G4") {
    G4++;
  }
  if (dataPoint.getAirlineCode() == "HA") {
    HA++;
  }
  if (dataPoint.getAirlineCode() == "NK") {
    NK++;
  }
  if (dataPoint.getAirlineCode() == "UA") {
    UA++;
  }
  if (dataPoint.getAirlineCode() == "WN") {
    WN++;
  }
  println(AA);
  println(AS);
  println(B6);
  println(DL);
  println(F9);
  println(G4);
  println(HA);
  println(NK);
  println(UA);
  println(WN);
}
