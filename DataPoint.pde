// toString created by Ben and Michael
// Ben Bryce, Created function to convert String to print, and another to do string to text to output, 10:00, 14/03/2024
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
  int schedDeptTime;
  int deptTime;
  int schedArrTime;
  int arrTime;
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
    int schedDeptTime,
    int deptTime,
    int schedArrTime,
    int arrTime,
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
    this.diverted = diverted;
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
  int getSchedDeptTime () {
    return schedDeptTime;
  }
  int getDeptTime () {
    return deptTime;
  }
  int getSchedArrTime () {
    return schedArrTime;
  }
  int getArrTime () {
    return arrTime;
  }
  boolean getCancelled () {
    return cancelled;
  }
  boolean getDiverted () {
    return diverted;
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
    //size(100, 100);
    textSize(15);
    text(dataString, 40, 120); 
  }




  String toString() {
    String longString = "";
    longString = "Flight Date: "+flightDate+", Airline: "+airlineCode+", Flight Number`: "+
    String.valueOf(flightNum)+"\nOrigin Airport: "+originAirport+", Origin City: "+originCity+", Origin State"+
    originState+", Origin WAC: "+String.valueOf(originWAC)+"\nDestination Airport: "+destAirport+", Destination City:"+
    destCity+", Destination State:"+destState+", Destination WAC:"+String.valueOf(destWAC)+"\nScheduled Departure Time:"+ 
    schedDeptTime+", Departure Time: "+deptTime+", Scheduled Arrival: "+schedArrTime+", Arrival Time: "+arrTime+
    "\nFlight Cancelled: "+cancelled+ ", Flight Diverted: "+diverted+", Flight Distance: "+String.valueOf(distance)+"\n";
    return longString;
  }
  
}
