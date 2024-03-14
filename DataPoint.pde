class DataPoint {
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
  boolean diverted;
  int distance;
  DataPoint(  String flightDate,
    String airlineCode,
    int flightNum,
    String originAirport,
    String originCity,
    String originState,
    int originWAC,
    String destAirport,
    String destCity,
    String destState,
    int destWAC,
    String schedDeptTime,
    String deptTime,
    String schedArrTime,
    String arrTime,
    boolean cancelled,
    boolean diverted,
    int distance) {
    this.flightDate = flightDate;
    this.airlineCode = airlineCode;
    this.flightNum = flightNum;
    this.originAirport = originAirport;
    this.originCity = originCity;
    this.originState = originState;
    this.originWAC = originWAC;
    this.destAirport = destAirport;
    this.destCity = destCity;
    this.destState = destState;
    this.destWAC = destWAC;
    this.schedDeptTime = schedDeptTime;
    this.deptTime = deptTime;
    this.schedArrTime = schedArrTime;
    this.arrTime = arrTime;
    this.cancelled = cancelled;
    this.delayed = diverted;
    this.distance = distance;
  }
  String getFlightDate () {
    return flightDate;
  }
  String getAirlineCode () {
    return airlineCode;
  }
  int getFlightNum () {
    return flightNum;
  }
  String getOriginAirport () {
    return originAirport;
  }
  String getOriginCity () {
    return originCity;
  }
  String getOriginState () {
    return originState;
  }
  int getOriginWAC () {
    return originWAC;
  }
  String getDestAirport () {
    return destAirport;
  }
  String getDestCity () {
    return destCity;
  }
  String getDestState () {
    return destState;
  }
  int getDestWAC () {
    return destWAC;
  }
  String getSchedDeptTime () {
    return schedDeptTime;
  }
  String getDeptTime () {
    return deptTime;
  }
  String getSchedArrTime () {
    return schedArrTime;
  }
  String getArrTime () {
    return arrTime;
  }
  boolean getCancelled () {
    return cancelled;
  }
  boolean getDelayed () {
    return delayed;
  }
  int getDistance () {
    return distance;
  }
   void printAllData(String dataString){
    System.out.println(dataString);
  }
  
  void stringToText(String dataString){
    PFont font;
    font = createFont("AppleSDGothicNeo-Medium-18", 128);
    textFont(font);
    size(400, 400);
    textSize(18);
    text(dataString, 40, 120); 
  }
}


