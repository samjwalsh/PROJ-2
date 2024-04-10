// Mitchell Ashmore created the Filter class, Thursday 14/3/2024, 9:00-11:00
// S. Walsh modified filter class to accept DataPoint array lists as inputs and outputs 20/03/2024, 16:30
// S. Walsh, Created filter class to select only flights by specific airlines, 22:00 26/03/2024
class Filter {

  ArrayList<DataPoint> isCancelled(ArrayList<DataPoint> data) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
    for (DataPoint dataPoint : data) {
      if (dataPoint.getCancelled() == true) {
        filteredData.add(dataPoint);
      }
    }
    return filteredData;
  }

  //ArrayList<DataPoint> FILTERNAME(ArrayList<DataPoint> data, EXTRAPARAMS) {
  //  ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
  //  for (DataPoint dataPoint : data) {
  //    if (CONDITION) {
  //      filteredData.add(dataPoint);
  //    }
  //  }
  //  return filteredData;
  //}
  ArrayList<DataPoint> onlySelectStates(ArrayList<DataPoint> data, ArrayList<String> states) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
    for (DataPoint dataPoint : data) {
      if (states.contains(dataPoint.getOriginState())) {
        filteredData.add(dataPoint);
      }
    }
    return filteredData;
  }

  ArrayList<DataPoint> distanceBetween(ArrayList<DataPoint> data, int min, int max) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
    for (DataPoint dataPoint : data) {
      if (dataPoint.getDistance() <= max && dataPoint.getDistance() >= min) {
        filteredData.add(dataPoint);
      }
    }
    return filteredData;
  }

  ArrayList<DataPoint> dateBetween(ArrayList<DataPoint> data, int min, int max) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
    // Fix min and max values if not specified
    if (min == 0) min = 1;
    if (max == 0) max = 31;
    for (DataPoint dataPoint : data) {
      int date = parseInt(dataPoint.getFlightDate().split("/")[1]);

      if (date <= max && date >= min) {
        filteredData.add(dataPoint);
      }
    }
    return filteredData;
  }


  ArrayList<DataPoint> onlySelectAirlines(ArrayList<DataPoint> data, ArrayList<String> airports) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
    for (DataPoint dataPoint : data) {
      if (airports.contains(dataPoint.getAirlineCode())) {
        filteredData.add(dataPoint);
      }
    }
    return filteredData;
  }
  ArrayList<DataPoint> onlySelectOriginAirports(ArrayList<DataPoint> data, ArrayList<String> airports) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
    for (DataPoint dataPoint : data) {
      if (airports.contains(dataPoint.getOriginAirport())) {
        filteredData.add(dataPoint);
      }
    }
    return filteredData;
  }
  
    ArrayList<DataPoint> onlySelectDestAirports(ArrayList<DataPoint> data, ArrayList<String> airports) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
    for (DataPoint dataPoint : data) {
      if (airports.contains(dataPoint.getDestAirport())) {
        filteredData.add(dataPoint);
      }
    }
    return filteredData;
  }

  //ArrayList<DataPoint> FILTERNAME(ArrayList<DataPoint> data, EXTRAPARAMS) {
  //  ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
  //  for (DataPoint dataPoint : data) {
  //    if (CONDITION) {
  //      filteredData.add(dataPoint);
  //    }
  //  }
  //  return filteredData;
  //}

  ArrayList<DataPoint> distanceGreaterThan(ArrayList<DataPoint> data, int distance) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
    for (DataPoint dataPoint : data) {
      if (dataPoint.getDistance() >= distance) {
        filteredData.add(dataPoint);
      }
    }
    return filteredData;
  }

  ArrayList<DataPoint> isLateArrival(ArrayList<DataPoint> data) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
    for (DataPoint dataPoint : data) {
      int difference = dataPoint.getArrTime() - dataPoint.getSchedArrTime();
      if (difference < 0) {
        filteredData.add(dataPoint);
      }
    }
    return filteredData;
  }

  ArrayList<DataPoint> isLateLeaving(ArrayList<DataPoint> data) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
    for (DataPoint dataPoint : data) {
      int difference = dataPoint.getDeptTime() - dataPoint.getSchedDeptTime();
      if (difference < 0) {
        filteredData.add(dataPoint);
      }
    }
    return filteredData;
  }

  ArrayList<DataPoint> isDiverted(ArrayList<DataPoint> data) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
    for (DataPoint dataPoint : data) {
      if (dataPoint.getDiverted()) {
        filteredData.add(dataPoint);
      }
    }
    return filteredData;
  }

  ArrayList<DataPoint> isInternal(ArrayList<DataPoint> data) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
    for (DataPoint dataPoint : data) {
      if (dataPoint.getOriginState() == dataPoint.getDestState()) {
        filteredData.add(dataPoint);
      }
    }
    return filteredData;
  }
}
