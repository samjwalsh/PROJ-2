// S. Walsh, Created class for reading data from .csv file, 15:30, 13/03/2024

class DataReader {
  String[] data;
  DataReader(String filePath) {
    data = loadStrings(filePath);
    //printData(data);
  }

  ArrayList<DataPoint> readFile() {
    ArrayList<DataPoint> dataList = new ArrayList<DataPoint>();
    for (int dPIndex = 1; dPIndex < data.length ; dPIndex++ ) {
      String currDP = data[dPIndex];
      dataList.add(lineToDP(currDP));
    }
    return dataList;
  }

  DataPoint lineToDP(String line) {
    String[] data = line.split(",");
    for (int valIndex = 0; valIndex < data.length; valIndex++) {
    }
    String flightDate = data[0].split(" ")[0];
    String airlineCode = data[1];
    int flightNum = Integer.parseInt(data[2]);
    String originAirport = data[3];
    String originCity = data[4].substring(1);
    String originState = data[6];
    int originWAC = Integer.parseInt(data[7]);
    String destAirport = data[8];
    String destCity = data[9].substring(1);
    String destState = data[11];
    int destWAC = Integer.parseInt(data[12]);
    int schedDeptTime = Integer.parseInt(data[13]);
    int deptTime = data[14].length() > 0 ? Integer.parseInt(data[14]) : 2500;
    int schedArrTime = Integer.parseInt(data[15]);
    int arrTime = data[16].length() > 0 ? Integer.parseInt(data[16]) : 2500;
    boolean cancelled = data[17] == "1" ? true : false;
    boolean diverted = data[18] == "1" ? true : false;
    int distance = Integer.parseInt(data[19]);
    return new DataPoint(  flightDate,
      airlineCode,
      flightNum,
      originAirport,
      originCity,
      originState,
      originWAC,
      destAirport,
      destCity,
      destState,
      destWAC,
      schedDeptTime,
      deptTime,
      schedArrTime,
      arrTime,
      cancelled,
      diverted,
      distance);
  }
}
