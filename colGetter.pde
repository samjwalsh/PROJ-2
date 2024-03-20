// Mitchell Ashmore Saturday 16/3, Sunday 17/3
// Modified on Tuesday 19/3 Wednesday 20/3 to incorporate the DataPoint class
// displays graph of only origin airports count
import javax.swing.JOptionPane;
import java.util.ArrayList;

class colGetter {
  ArrayList<DataPoint> data;

  int airportNameOffset = 30;
  int barSpacing = 20;
  int margin = 50;

  colGetter(ArrayList<DataPoint> data) {
    this.data = data;
    String colInput = JOptionPane.showInputDialog("Enter column number: \nDate = 0\nCarrier = 1\nNumber = 2\nOrigin Airport = 3\nOrigin City = 4\nOrigin State = 5\nOrigin WAC = 6\nDestination Airport = 7\nDestination City = 8\nDestination State = 9\nDestination WAC = 10\nScheduled Departure Time = 11\nActual Departure Time = 12\nScheduled Arrival Time = 13\nActual Arrival Time = 14\nCancelled = 15\nDiverted = 16\nDistance = 17\n");
    int colNum = int(colInput);

    if (colNum == 3) {
      drawGraph(data);
    } else {
      printColumn(colNum);
    }
  }
  void drawGraph(ArrayList<DataPoint> data) {
    ArrayList<String> airportNames = new ArrayList<String>();
    ArrayList<Integer> airportCounts = new ArrayList<Integer>();

    for (DataPoint dataPoint : data) {
      String airport = getAirportName(dataPoint);
      if (airport != null) {
        int index = airportNames.indexOf(airport);
        if (index != -1) {
          int count = airportCounts.get(index) + 1;
          airportCounts.set(index, count);
        } else {
          airportNames.add(airport);
          airportCounts.add(1);
        }
      }
    }


    int maxValue = 0;
    for (int count : airportCounts) {
      maxValue = max(maxValue, count);
    }

    background(255);
    textSize(12);
    textAlign(LEFT);
    fill(0);

    line(margin, margin, margin, height - margin);
    line(margin, height - margin, width - margin, height - margin);

    for (int i = 0; i <= maxValue; i += maxValue / 10) {  // y axis
      float yPos = map(i, 0, maxValue, height - margin, margin);
      text(i, margin - 30, yPos);
      line(margin - 5, yPos, margin + 5, yPos);
    }

    int barWidth = (width - 2 * margin) / airportNames.size();
    int xPos = margin + 10;

    for (int i = 0; i < airportNames.size(); i++) {      // bars / x axis
      float yPos = map(airportCounts.get(i), 0, maxValue, height - margin, margin);
      rect(xPos, yPos, barWidth, height - margin - yPos);
      text(airportNames.get(i), xPos + barWidth / 2, height - margin + airportNameOffset);
      xPos += barWidth + barSpacing;
    }
  }

  String getAirportName(DataPoint dataPoint) {
    return dataPoint.getOriginAirport();
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
