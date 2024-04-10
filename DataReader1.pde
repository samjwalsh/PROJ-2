// // C. O'Brien, created seperate data reader, 21:30 29/03/2024
class DataReader1 {
  String filePath;
  Table csv;

  DataReader1(String filePath) {
    this.filePath = filePath;
    this.csv = loadTable(filePath, "header");
  }

  HashSet<String> readOriginAirports() {
    HashSet<String> uniqueAirports = new HashSet<String>();
    //HashSet used to eliminate duplicate airporst.

    for (TableRow row : csv.rows()) {
      String originAirport = row.getString("ORIGIN");
      uniqueAirports.add(originAirport);
    }

    return uniqueAirports;
  }
}
