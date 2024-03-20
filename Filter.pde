// Mitchell Ashmore created the Filter class, Thursday 14/3/2024, 9:00-11:00
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
