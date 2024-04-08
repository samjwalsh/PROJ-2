class DataReader1 {
  String filePath;
  Table csv;

  DataReader1(String filePath) {
    this.filePath = filePath;
    this.csv = loadTable(filePath, "header");
  }

  HashSet<String> readOriginAirports() {
    HashSet<String> uniqueAirports = new HashSet<String>();

    for (TableRow row : csv.rows()) {
      String originAirport = row.getString("ORIGIN");
      uniqueAirports.add(originAirport);
    }

    return uniqueAirports;
  }
}
