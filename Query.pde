// Make a query based off marketShare using " MKT_CARRIER "
// Each MKT_CARRIER has a 2 digit abbreviation, find out abbreviation and match to carrier
// Pie chart ?? showing this data


class Query {
  int AA;
  int AS;
  int B6;
  int DL;
  int F9;
  int G4;
  int HA;
  int NK;
  int UA;
  int WN;
  Query(int AA, int AS, int B6, int DL, int F9, int G4, int HA, int NK, int UA, int WN) {
    this.AA = AA;
    this.AS = AS;
    this.B6 = B6;
    this.DL = DL;
    this.F9 = F9;
    this.G4 = G4;
    this.HA = HA;
    this.NK = NK;
    this.UA = UA;
    this.WN = WN;
  }
  void marketShare(DataPoint dataPoint) {
    
    
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
}

Table flightsByDoW (ArrayList<DataPoint> data) {
    Table table = new Table();
    table.addColumn("Day of Week");
    table.addColumn("No. Flights");
    
    return table;
}

}
