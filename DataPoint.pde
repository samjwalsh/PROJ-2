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
  boolean delayed;
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
    boolean delayed,
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
    this.delayed = delayed;
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

  String toLongString(String flightDate, String airlineCode, int flightNum, String originAirport, String originCity, 
    String originState, int originWAC, String destAirport, String destCity, String destState, int destWAC, String schedDeptTime, 
    String deptTime, String schedArrTime, String arrTime, boolean cancelled, boolean delayed, int distance)
  {
    String longString = "";
    longString = "Flight Date: "+flightDate+", Airline: "+airlineCode+", Flight Number"+String.valueOf(flightNum)+
    "\nOrigin Airport: "+originAirport+", Origin City: "+originCity+", Origin State"+originState+", Origin WAC: "+
    String.valueOf(originWAC)+"\nDestination Airport: "+destAirport+", Destination City:"+destCity+", Destination State:"+
    destState+", Destination WAC:"+String.valueOf(destWAC)+"\nScheduled Departure Time:" + schedDeptTim+", Departure Time: "+ 
    deptTime+", Scheduled Arrival: "+schedArrTime+", Arrival Time: "+arrTime+"\nFlight Cancelled: "+
    cancelled+ ", Flight Delayed: "+delayed+", Flight Distance"+String.valueOf(distance)+"\n";

}
