// S.Walsh, created query for creating int array of flight distances through a given airport, 11:00, 21/03/2024 //<>// //<>// //<>//
// S.Walsh, created query for creating a table of flights by day of week, 11:00, 21/03/2024
// Mitchell Ashmore query for creating a table of market shares by Airlines, 12:30 21/3/2024
// M.Murphy created query for creating an object with int array of flights by date within a range, 5:00, 04/04/2024
// S.Walsh creates query for getting cancelled and not cancelled flights, 14:00, 8/04/2024
// S.Walsh created query for getting early and late flights, 15:00, 8/04/2024

class Query {


  int[] flightDistances(ArrayList<DataPoint> data, String airport) {
    ArrayList<Integer> distancesAL = new ArrayList<Integer>();

    // Only keeps selected airports
    for (DataPoint dataPoint : data) {
      if (dataPoint.getOriginAirport().equals(airport)) {
        distancesAL.add(dataPoint.getDistance());
      }
    }

    // Creates an array of the distances
    int[] array = new int[distancesAL.size()];
    for (int i = 0; i < distancesAL.size(); i++ ) {
      array[i] = distancesAL.get(i);
    }


    return array;
  }


  int[] flightDistancesAllData(ArrayList<DataPoint> data) {
    ArrayList<Integer> distancesAL = new ArrayList<Integer>();

    for (DataPoint dataPoint : data) {
      distancesAL.add(dataPoint.getDistance());
    }

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
        c.setTime(new SimpleDateFormat("mm/dd/yyyy").parse(dataPoint.getFlightDate()));
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

  Table cancelledFlights(ArrayList<DataPoint> data) {
    //
    int notCancelled = 0;
    int cancelled = 0;

    for (DataPoint dataPoint : data) {

      if (dataPoint.getCancelled()) cancelled++;
      else notCancelled++;
    }

    Table table = new Table();
    table.addColumn("State");
    table.addColumn("Count");

    TableRow cancelledRow = table.addRow();
    cancelledRow.setString("State", "Cancelled");
    cancelledRow.setInt("Count", cancelled);

    TableRow notCancelledRow = table.addRow();
    notCancelledRow.setString("State", "Not Cancelled");
    notCancelledRow.setInt("Count", notCancelled);

    return table;
  }

  Table delayedFlights(ArrayList<DataPoint> data) {

    int delayed = 0;
    int onTime = 0;
    int early = 0;
    for (DataPoint flight : data) {
      int sched = flight.getSchedArrTime();
      int acc = flight.getArrTime();
      // Add 24 hours to weird flights
      if (Math.abs(sched - acc) > 2000) {
        if (sched < acc) sched+= 2400;
        else acc += 2400;
      }

      if (sched < acc) {
        delayed++;
      } else if (sched > acc) {
        early++;
      } else {
        // Flight is early (or took 24 hrs?)
        onTime++;
      }
    }

    Table table = new Table();
    table.addColumn("State");
    table.addColumn("Count");
    TableRow earlyRow = table.addRow();
    earlyRow.setString("State", "Early");
    earlyRow.setInt("Count", early);
    TableRow onTimeRow = table.addRow();
    onTimeRow.setString("State", "On Time");
    onTimeRow.setInt("Count", onTime);

    TableRow delayedRow = table.addRow();
    delayedRow.setString("State", "Delayed");
    delayedRow.setInt("Count", delayed);




    return table;
  }


  Table marketShare(ArrayList<DataPoint> data) {
    int AA, AS, B6, DL, F9, G4, HA, NK, UA, WN;
    AA = AS = B6 = DL = F9 = G4 = HA = NK = UA =WN = 0;
    for (DataPoint dataPoint : data) {
      if (dataPoint.getAirlineCode().equals("AA")) {
        AA++;
      }
      if (dataPoint.getAirlineCode().equals("AS")) {
        AS++;
      }
      if (dataPoint.getAirlineCode().equals("B6")) {
        B6++;
      }
      if (dataPoint.getAirlineCode().equals("DL")) {
        DL++;
      }
      if (dataPoint.getAirlineCode().equals("F9")) {
        F9++;
      }
      if (dataPoint.getAirlineCode().equals("G4")) {
        G4++;
      }
      if (dataPoint.getAirlineCode().equals("HA")) {
        HA++;
      }
      if (dataPoint.getAirlineCode().equals("NK")) {
        NK++;
      }
      if (dataPoint.getAirlineCode().equals("UA")) {
        UA++;
      }
      if (dataPoint.getAirlineCode().equals("WN")) {
        WN++;
      }
    }

    Table tableTwo = new Table();
    // Creates a table with column 0 being "Airline" and column 1 being "No.Flights",
    // where "No.Flights" is the count of each instance of an airline
    tableTwo.addColumn("Airline");
    tableTwo.addColumn("No. Flights");

    TableRow AARow = tableTwo.addRow();
    AARow.setString("Airline", "American Airlines");
    AARow.setInt("No. Flights", AA);

    TableRow ASRow = tableTwo.addRow();
    ASRow.setString("Airline", "Alaska Airlines");
    ASRow.setInt("No. Flights", AS);

    TableRow B6Row = tableTwo.addRow();
    B6Row.setString("Airline", "Jet Blue");
    B6Row.setInt("No. Flights", B6);

    TableRow DLRow = tableTwo.addRow();
    DLRow.setString("Airline", "Delta Airlines");
    DLRow.setInt("No. Flights", DL);

    TableRow F9Row = tableTwo.addRow();
    F9Row.setString("Airline", "Frontier Airlines");
    F9Row.setInt("No. Flights", F9);

    TableRow G4Row = tableTwo.addRow();
    G4Row.setString("Airline", "Allegiant Air");
    G4Row.setInt("No. Flights", G4);

    TableRow HARow = tableTwo.addRow();
    HARow.setString("Airline", "Hawaiian Airlines");
    HARow.setInt("No. Flights", HA);

    TableRow NKRow = tableTwo.addRow();
    NKRow.setString("Airline", "Spirit Airlines");
    NKRow.setInt("No. Flights", NK);

    TableRow UARow = tableTwo.addRow();
    UARow.setString("Airline", "United Airlines");
    UARow.setInt("No. Flights", UA);

    TableRow WNRow = tableTwo.addRow();
    WNRow.setString("Airline", "Southwest Airlines");
    WNRow.setInt("No. Flights", WN);

    return tableTwo;
  }


  Table flightsByState(ArrayList<DataPoint> data) {
    int AK, AL, AR, AZ, CA, CO, CT, DE, FL, GA, HI, IA, ID, IL, IN, KS, KY, LA, MA, MD, ME, MI, MN, MO, MS, MT, NC, ND, NE, NH, NJ, NM, NV, NY, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VA, VT, WA, WI, WV, WY;
    AK=AL=AR=AZ=CA=CO=CT=DE=FL=GA=HI=IA=ID=IL=IN=KS=KY=LA=MA=MD=ME=MI=MN=MO=MS=MT=NC=ND=NE=NH=NJ=NM=NV=NY=OH=OK=OR=PA=RI=SC=SD=TN=TX=UT=VA=VT=WA=WI=WV=WY=0;
    for (DataPoint dataPoint : data) {
      if (dataPoint.getOriginState().equals("AK")) {  // Compares data from CSV to determine which state instance to increase count of
        AK++;
      }
      if (dataPoint.getOriginState().equals("AL")) {
        AL++;
      }
      if (dataPoint.getOriginState().equals("AR")) {
        AR++;
      }
      if (dataPoint.getOriginState().equals("AZ")) {
        AZ++;
      }
      if (dataPoint.getOriginState().equals("CA")) {
        CA++;
      }
      if (dataPoint.getOriginState().equals("CO")) {
        CO++;
      }
      if (dataPoint.getOriginState().equals("CT")) {
        CT++;
      }
      if (dataPoint.getOriginState().equals("DE")) {
        DE++;
      }
      if (dataPoint.getOriginState().equals("FL")) {
        FL++;
      }
      if (dataPoint.getOriginState().equals("GA")) {
        GA++;
      }
      if (dataPoint.getOriginState().equals("HI")) {
        HI++;
      }
      if (dataPoint.getOriginState().equals("IA")) {
        IA++;
      }
      if (dataPoint.getOriginState().equals("ID")) {
        ID++;
      }
      if (dataPoint.getOriginState().equals("IL")) {
        IL++;
      }
      if (dataPoint.getOriginState().equals("IN")) {
        IN++;
      }
      if (dataPoint.getOriginState().equals("KS")) {
        KS++;
      }
      if (dataPoint.getOriginState().equals("KY")) {
        KY++;
      }
      if (dataPoint.getOriginState().equals("LA")) {
        LA++;
      }
      if (dataPoint.getOriginState().equals("MA")) {
        MA++;
      }
      if (dataPoint.getOriginState().equals("MD")) {
        MD++;
      }
      if (dataPoint.getOriginState().equals("ME")) {
        ME++;
      }
      if (dataPoint.getOriginState().equals("MI")) {
        MI++;
      }
      if (dataPoint.getOriginState().equals("MN")) {
        MN++;
      }
      if (dataPoint.getOriginState().equals("MO")) {
        MO++;
      }
      if (dataPoint.getOriginState().equals("MS")) {
        MS++;
      }
      if (dataPoint.getOriginState().equals("MT")) {
        MT++;
      }
      if (dataPoint.getOriginState().equals("NC")) {
        NC++;
      }
      if (dataPoint.getOriginState().equals("ND")) {
        ND++;
      }
      if (dataPoint.getOriginState().equals("NE")) {
        NE++;
      }
      if (dataPoint.getOriginState().equals("NH")) {
        NH++;
      }
      if (dataPoint.getOriginState().equals("NJ")) {
        NJ++;
      }
      if (dataPoint.getOriginState().equals("NM")) {
        NM++;
      }
      if (dataPoint.getOriginState().equals("NV")) {
        NV++;
      }
      if (dataPoint.getOriginState().equals("NY")) {
        NY++;
      }
      if (dataPoint.getOriginState().equals("OH")) {
        OH++;
      }
      if (dataPoint.getOriginState().equals("OK")) {
        OK++;
      }
      if (dataPoint.getOriginState().equals("OR")) {
        OR++;
      }
      if (dataPoint.getOriginState().equals("PA")) {
        PA++;
      }
      if (dataPoint.getOriginState().equals("RI")) {
        RI++;
      }
      if (dataPoint.getOriginState().equals("SC")) {
        SC++;
      }
      if (dataPoint.getOriginState().equals("SD")) {
        SD++;
      }
      if (dataPoint.getOriginState().equals("TN")) {
        TN++;
      }
      if (dataPoint.getOriginState().equals("TX")) {
        TX++;
      }
      if (dataPoint.getOriginState().equals("UT")) {
        UT++;
      }
      if (dataPoint.getOriginState().equals("VA")) {
        VA++;
      }
      if (dataPoint.getOriginState().equals("VT")) {
        VT++;
      }
      if (dataPoint.getOriginState().equals("WA")) {
        WA++;
      }
      if (dataPoint.getOriginState().equals("WI")) {
        WI++;
      }
      if (dataPoint.getOriginState().equals("WV")) {
        WV++;
      }
      if (dataPoint.getOriginState().equals("WY")) {
        WY++;
      }
    }

    Table stateTable = new Table();    // Generates the table with column 0 being "State" and column 1 being "Flights", where "Flights" is the count from each State
    stateTable.addColumn("State");
    stateTable.addColumn("Flights");

    TableRow AKRow = stateTable.addRow();
    AKRow.setString("State", "AK");
    AKRow.setInt("Flights", AK);
    TableRow ALRow = stateTable.addRow();
    ALRow.setString("State", "AL");
    ALRow.setInt("Flights", AL);
    TableRow ARRow = stateTable.addRow();
    ARRow.setString("State", "AR");
    ARRow.setInt("Flights", AR);
    TableRow AZRow = stateTable.addRow();
    AZRow.setString("State", "AZ");
    AZRow.setInt("Flights", AZ);
    TableRow CARow = stateTable.addRow();
    CARow.setString("State", "CA");
    CARow.setInt("Flights", CA);
    TableRow CORow = stateTable.addRow();
    CORow.setString("State", "CO");
    CORow.setInt("Flights", CO);
    TableRow CTRow = stateTable.addRow();
    CTRow.setString("State", "CT");
    CTRow.setInt("Flights", CT);
    TableRow DERow = stateTable.addRow();
    DERow.setString("State", "DE");
    DERow.setInt("Flights", DE);
    TableRow FLRow = stateTable.addRow();
    FLRow.setString("State", "FL");
    FLRow.setInt("Flights", FL);
    TableRow GARow = stateTable.addRow();
    GARow.setString("State", "GA");
    GARow.setInt("Flights", GA);
    TableRow HIRow = stateTable.addRow();
    HIRow.setString("State", "HI");
    HIRow.setInt("Flights", HI);
    TableRow IARow = stateTable.addRow();
    IARow.setString("State", "IA");
    IARow.setInt("Flights", IA);
    TableRow IDRow = stateTable.addRow();
    IDRow.setString("State", "ID");
    IDRow.setInt("Flights", ID);
    TableRow ILRow = stateTable.addRow();
    ILRow.setString("State", "IL");
    ILRow.setInt("Flights", IL);
    TableRow INRow = stateTable.addRow();
    INRow.setString("State", "IN");
    INRow.setInt("Flights", IN);
    TableRow KSRow = stateTable.addRow();
    KSRow.setString("State", "KS");
    KSRow.setInt("Flights", KS);
    TableRow KYRow = stateTable.addRow();
    KYRow.setString("State", "KY");
    KYRow.setInt("Flights", KY);
    TableRow LARow = stateTable.addRow();
    LARow.setString("State", "LA");
    LARow.setInt("Flights", LA);
    TableRow MARow = stateTable.addRow();
    MARow.setString("State", "MA");
    MARow.setInt("Flights", MA);
    TableRow MDRow = stateTable.addRow();
    MDRow.setString("State", "MD");
    MDRow.setInt("Flights", MD);
    TableRow MERow = stateTable.addRow();
    MERow.setString("State", "ME");
    MERow.setInt("Flights", ME);
    TableRow MIRow = stateTable.addRow();
    MIRow.setString("State", "MI");
    MIRow.setInt("Flights", MI);
    TableRow MNRow = stateTable.addRow();
    MNRow.setString("State", "MN");
    MNRow.setInt("Flights", MN);
    TableRow MORow = stateTable.addRow();
    MORow.setString("State", "MO");
    MORow.setInt("Flights", MO);
    TableRow MSRow = stateTable.addRow();
    MSRow.setString("State", "MS");
    MSRow.setInt("Flights", MS);
    TableRow MTRow = stateTable.addRow();
    MTRow.setString("State", "MT");
    MTRow.setInt("Flights", MT);
    TableRow NCRow = stateTable.addRow();
    NCRow.setString("State", "NC");
    NCRow.setInt("Flights", NC);
    TableRow NDRow = stateTable.addRow();
    NDRow.setString("State", "ND");
    NDRow.setInt("Flights", ND);
    TableRow NERow = stateTable.addRow();
    NERow.setString("State", "NE");
    NERow.setInt("Flights", NE);
    TableRow NHRow = stateTable.addRow();
    NHRow.setString("State", "NH");
    NHRow.setInt("Flights", NH);
    TableRow NJRow = stateTable.addRow();
    NJRow.setString("State", "NJ");
    NJRow.setInt("Flights", NJ);
    TableRow NMRow = stateTable.addRow();
    NMRow.setString("State", "NM");
    NMRow.setInt("Flights", NM);
    TableRow NVRow = stateTable.addRow();
    NVRow.setString("State", "NV");
    NVRow.setInt("Flights", NV);
    TableRow NYRow = stateTable.addRow();
    NYRow.setString("State", "NY");
    NYRow.setInt("Flights", NY);
    TableRow OHRow = stateTable.addRow();
    OHRow.setString("State", "OH");
    OHRow.setInt("Flights", OH);
    TableRow OKRow = stateTable.addRow();
    OKRow.setString("State", "OK");
    OKRow.setInt("Flights", OK);
    TableRow ORRow = stateTable.addRow();
    ORRow.setString("State", "OR");
    ORRow.setInt("Flights", OR);
    TableRow PARow = stateTable.addRow();
    PARow.setString("State", "PA");
    PARow.setInt("Flights", PA);
    TableRow RIRow = stateTable.addRow();
    RIRow.setString("State", "RI");
    RIRow.setInt("Flights", RI);
    TableRow SCRow = stateTable.addRow();
    SCRow.setString("State", "SC");
    SCRow.setInt("Flights", SC);
    TableRow SDRow = stateTable.addRow();
    SDRow.setString("State", "SD");
    SDRow.setInt("Flights", SD);
    TableRow TNRow = stateTable.addRow();
    TNRow.setString("State", "TN");
    TNRow.setInt("Flights", TN);
    TableRow TXRow = stateTable.addRow();
    TXRow.setString("State", "TX");
    TXRow.setInt("Flights", TX);
    TableRow UTRow = stateTable.addRow();
    UTRow.setString("State", "UT");
    UTRow.setInt("Flights", UT);
    TableRow VARow = stateTable.addRow();
    VARow.setString("State", "VA");
    VARow.setInt("Flights", VA);
    TableRow VTRow = stateTable.addRow();
    VTRow.setString("State", "VT");
    VTRow.setInt("Flights", VT);
    TableRow WARow = stateTable.addRow();
    WARow.setString("State", "WA");
    WARow.setInt("Flights", WA);
    TableRow WIRow = stateTable.addRow();
    WIRow.setString("State", "WI");
    WIRow.setInt("Flights", WI);
    TableRow WVRow = stateTable.addRow();
    WVRow.setString("State", "WV");
    WVRow.setInt("Flights", WV);
    TableRow WYRow = stateTable.addRow();
    WYRow.setString("State", "WY");
    WYRow.setInt("Flights", WY);
    return stateTable;
  }


  // An object containing an int array of dates corresponding to a certain range, also an int array.
  public class DatesInRange {
    private int[] dates;
    private int[] range;

    public DatesInRange(int[] dates, int[] range) {
      this.dates = dates;
      this.range = range;
    }
    public int[] getDates() {
      return dates;
    }
    public int[] getRange() {
      return range;
    }
  }

  // Returns a DatesInRange object (above) based on the filtered data given passed as a parameter ArrayList
  public DatesInRange flightsByDate(ArrayList<DataPoint> data) {
    int min = parseInt(data.get(0).getFlightDate().split("/")[1]);
    int max = parseInt(data.get(data.size()-1).getFlightDate().split("/")[1]);
    println(min+" "+max);
    int[] range = {min, max};
    int[] dates = new int[range[1]-(range[0]-1)];
    int baseDate = range[0];
    int date; int index = 0;
    for (DataPoint dataPoint : data) {
      date = parseInt(dataPoint.getFlightDate().split("/")[1]);
      if(0 == baseDate - date) dates[index] += 1;
      else {        
        index += 1;
        baseDate += 1;
        if(index >= 0 && index <= range[1]-range[0]) {
          dates[index] += 1;
        }
      }
    }
    return new DatesInRange(dates, range);
  }
}
