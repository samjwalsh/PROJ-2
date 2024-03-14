// S. Walsh, Created class for reading data from .csv file, 15:30, 13/03/2024

class DataReader {
  DataReader(String filePath) {
    String[] data = loadStrings(filePath);
    for (int line = 0; line < data.length; line++) {
      //println(data[line]);
    }
  }
  ArrayList<DataPoint> filterData(String queryName) {
    ArrayList<DataPoint> filteredData = new ArrayList<DataPoint>();
    // Add and remove an item from the ArrayList to initialise it
    // filteredData.add(new DataPoint());
    switch (queryName) {
      default: {
        break;
      }
    }
    return filteredData;
  }
  
  //DataPoint lineToDP(String line) {
    
  //}
}
