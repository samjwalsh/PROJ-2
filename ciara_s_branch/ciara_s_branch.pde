import java.util.ArrayList;
import java.util.HashSet;
import processing.data.Table;
import processing.data.TableRow;
import java.util.Collections;

int currentPage = 0; 
int airportsPerPage = 10; 
int totalPages; 
String[] airports; 

void setup() {
    noStroke();
    rectMode(CENTER);
    textAlign(CENTER);
    size(1000, 800);
    
    DataReader reader = new DataReader("flights_full.csv");
    HashSet<String> uniqueOriginAirports = reader.readOriginAirports();
    ArrayList<String> originAirportsList = new ArrayList<String>(uniqueOriginAirports);
    Collections.sort(originAirportsList);
    airports = originAirportsList.toArray(new String[0]);
    totalPages = ceil((float)airports.length / airportsPerPage);
}

void draw() {
    background(255, 212, 229);
    drawUI();
    displayCurrentPageAirports();
}

void drawUI() {
 
  fill(244, 144, 185);
  rect(300, 600, 500, 300);


  fill(255);
  rect(300, 600, 475, 260);
  textSize(20);
  fill(255); // Text color
  text("SELECT AIRPORT", 300, 465);
  



  fill(149, 199, 194);
  rect(100, 770, 50, 30);
  fill(255); 
  textSize(10);
  text("BACK", 100, 775);
  

  fill(149, 199, 194);
  rect(500, 770, 50, 30);
  fill(255); 
  text("NEXT", 500, 775);
  
  
  
        stroke(150); 
        line(62, 485, 535, 485); 
        noStroke(); 
  
        stroke(150); 
        line(62, 505, 535, 505); 
        noStroke(); 
  
        stroke(150); 
        line(62, 525, 535, 525); 
        noStroke(); 
        
        stroke(150); 
        line(62, 545, 535, 545);
        noStroke();
  
        stroke(150);
        line(62, 565, 535, 565);
        noStroke(); 
  
  
        stroke(150); 
        line(62, 585, 535, 585); 
        noStroke(); 
  
        stroke(150); 
        line(62, 605, 535, 605); 
        noStroke(); 
       
        stroke(150); 
        line(62, 625, 535, 625); 
        noStroke(); 
        
        stroke(150); 
        line(62, 645, 535, 645); 
        noStroke();
        
        stroke(150); 
        line(62, 665, 535, 665); 
        noStroke(); 
        
        stroke(150); 
        line(62, 685, 535, 685);
        noStroke(); 
}

void displayCurrentPageAirports() {
    int startIdx = currentPage * airportsPerPage;
    int endIdx = min(startIdx + airportsPerPage, airports.length);
    textSize(12);
    fill(0); 

    for (int i = startIdx; i < endIdx; i++) {
        int yPos = 500 + (i - startIdx) * 20; // Adjust spacing and position as needed
        text(airports[i], 300, yPos);
    }
}

void mousePressed() {
    if (mouseX >= 475 && mouseX <= 525 && mouseY >= 755 && mouseY <= 785) {
        if (currentPage < totalPages - 1) {
            currentPage++;
        }
    }
   
    if (mouseX >= 75 && mouseX <= 125 && mouseY >= 755 && mouseY <= 785) {
        if (currentPage > 0) {
            currentPage--;
        }
    }
}

class DataReader {
    String filePath;
    Table csv;

    DataReader(String filePath) {
        this.filePath = filePath;
        this.csv = loadTable(filePath, "header");
    }

    HashSet<String> readOriginAirports() {
        HashSet<String> uniqueAirports = new HashSet<String>();

        for (TableRow row : csv.rows()) {
            String originAirport = row.getString("ORIGIN");
            uniqueAirports.add(originAirport);
        }

        return uniqueAirports;
    }
}
