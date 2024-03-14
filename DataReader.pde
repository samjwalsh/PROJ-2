// S. Walsh, Created class for reading data from .csv file, 15:30, 13/03/2024

class DataReader {
  String[] data;
  DataReader(String filePath) {
    data = loadStrings(filePath);
    //printData(data);
  }

  ArrayList<DataPoint> filterData(String queryName) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();

    for (int currDPIndex = 0; currDPIndex < data.length; currDPIndex++) {
      String currDP = data[currDPIndex];
      switch (queryName) {
      default:
        {
          filteredData.add(lineToDP(currDP));
          break;
        }
      }
    }
    return filteredData;
  }

  DataPoint lineToDP(String line) {
    String[] data = line.split(",");
    for (int valIndex = 0; valIndex < data.length; valIndex++) {
      println(data[valIndex]);
    }
      String flightDate;
  String airlineCode;
  int flightNum;
  String originAirport;
  String originCity;
  String originState;
  int originWAC;
  String destAirport;
  String destCity;
  String destState;
  int destWAC;
  String schedDeptTime;
  String deptTime;
  String schedArrTime;
  String arrTime;
  boolean cancelled;
  boolean delayed;
  int distance;
    return new DataPoint( "test",
      "test",
      7, "test", "test",
      "test", 7,
      "test", "test",
      "test", 7,
      "test", "test",
      "test", "test", false,
      false, 7);
  }

  void printData(String[] data) {
    for (int lineIndex = 0; lineIndex < data.length; lineIndex++) {
      String line = data[lineIndex];
      println(line);
    }
  }
}
