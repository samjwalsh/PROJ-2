// Mitchell Ashmore Saturday 16/3, Sunday 17/3
// Modified on Tuesday 19/3 Wednesday 20/3 to incorporate other DataPoint class and DataReader class
import javax.swing.JOptionPane;
import java.util.ArrayList;

class colGetter {
  ArrayList<DataPoint> data;

  colGetter(ArrayList<DataPoint> data) {
    this.data = data;
    String colInput = JOptionPane.showInputDialog("Enter column number: \nDate = 0\nCarrier = 1\nNumber = 2\nOrigin Airport = 3\nOrigin City = 4\nOrigin State = 5\nOrigin WAC = 6\nDestination Airport = 7\nDestination City = 8\nDestination State = 9\nDestination WAC = 10\nScheduled Departure Time = 11\nActual Departure Time = 12\nScheduled Arrival Time = 13\nActual Arrival Time = 14\nCancelled = 15\nDiverted = 16\nDistance = 17\n");
    int colNum = int(colInput);

    printColumn(colNum);
  }

  void printColumn(int columnNum) {
    String columnName = "";
    
    switch(columnNum) {
    case 0:
      columnName = "Flight Dates: ";
      break;
    case 1:
      columnName = "Market Carriers: ";
      break;
    case 2:
      columnName = "Market Flight Number: ";
      break;
    case 3:
      columnName = "Origin Airport: ";
      break;
    case 4:
      columnName = "Origin City: ";
      break;
    case 5:
      columnName = "Origin State: ";
      break;
    case 6:
      columnName = "Origin WAC: ";
      break;
    case 7:
      columnName = "Destination Airport : ";
      break;
    case 8:
      columnName = "Destination City : ";
      break;
    case 9:
      columnName = "Destination State: ";
      break;
    case 10:
      columnName = "Destination WAC: ";
      break;
    case 11:
      columnName = "Scheduled Departure: ";
      break;
    case 12:
      columnName = "Actual Departure: ";
      break;
    case 13:
      columnName = "Scheduled Arrival: ";
      break;
    case 14:
      columnName = "Actual Arrival: ";
      break;
    case 15:
      columnName = "Cancelled: ";
      break;
    case 16:
      columnName = "Diverted: ";
      break;
    case 17:
      columnName = "Distance: ";
      break;
    default:
      columnName = "Unknown name";
    }
  

    textSize(12);
    textAlign(LEFT);
    fill(0);

    text(columnName, 50, 50);

    int yPos = 70;
    int xPos = 50;
    for (DataPoint dataPoint : data) {
      String value = getColumnValue(dataPoint, columnNum);
      text(value, xPos, yPos);
      yPos += 20;
      if (yPos > screenY) {
        yPos = 70;
        xPos += 70;
      }
    }
  }


  String getColumnValue(DataPoint dataPoint, int columnNum) {
    switch(columnNum) {
    case 0:
      return dataPoint.getFlightDate();
    case 1:
      return dataPoint.getAirlineCode();
    case 2:
      return String.valueOf(dataPoint.getFlightNum());
    case 3:
      return dataPoint.getOriginAirport();
    case 4:
      return dataPoint.getOriginCity();
    case 5:
      return dataPoint.getOriginState();
    case 6:
      return String.valueOf(dataPoint.getOriginWAC());
    case 7:
      return dataPoint.getDestAirport();
    case 8:
      return dataPoint.getDestCity();
    case 9:
      return dataPoint.getDestState();
    case 10:
      return String.valueOf(dataPoint.getDestWAC());
    case 11:
      return String.valueOf(dataPoint.getSchedDeptTime());
    case 12:
      return String.valueOf(dataPoint.getDeptTime());
    case 13:
      return String.valueOf(dataPoint.getSchedArrTime());
    case 14:
      return String.valueOf(dataPoint.getArrTime());
    case 15:
      return String.valueOf(dataPoint.getCancelled());
    case 16:
      return String.valueOf(dataPoint.getDiverted());
    case 17:
      return String.valueOf(dataPoint.getDistance());
    default:
      return "Unknown";    // could prompt user to input again
    }
  }
}
