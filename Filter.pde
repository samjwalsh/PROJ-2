// Mitchell Ashmore created the Filter class, Thursday 14/3/2024, 9:00-11:00
class Filter {
  boolean isCancelled(DataPoint dataPoint) {
    if (dataPoint.getCancelled() == true) {
      return true;
    }
    return false;
  }

  boolean distanceGreaterThan(DataPoint dataPoint, int distance) {
    if (dataPoint.getDistance() >= distance) {
      return true;
    }
    return false;
  }

  boolean isLateArrival(DataPoint dataPoint) {
    int difference = dataPoint.getArrTime() - dataPoint.getSchedArrTime();
    if (difference < 0) {
      return true;      // true = delayed
    }
    return false;       // false = early
  }

  boolean isLateLeaving(DataPoint dataPoint) {
    int difference = dataPoint.getDeptTime() - dataPoint.getSchedDeptTime();
    if (difference < 0) {
      return false;    // false = early leaving
    }
    return true;       // true = late leaving
  }

  boolean isDiverted(DataPoint dataPoint) {
    if (dataPoint.getDiverted() == true) {
      return true;     // true = flight was diverted
    }
    return false;      // false = flight stayed on path
  }

  boolean isInternal(DataPoint dataPoint) {
    if (dataPoint.getOriginState() == dataPoint.getDestState()) {
      return true;        // true = internal state flight
    }
    return false;         // false = state to state flight
  }
}
