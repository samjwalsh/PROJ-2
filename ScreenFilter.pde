// C. Quinn, Created class for filter screen, 11:30, 29/03/2024

class ScreenFilter extends Screen {
  
  
  ScreenFilter(PApplet parent) {
    super(parent);
    add(new Widget(20, height-60, 100, 40,
      "Home", color(255), font, "Home"));
    
  }
  
  void draw() {
    background(255);
    drawWidgets();
    
    scroll.draw();
    scroll.update(mouseX,mouseY);
    checkBoxesAirlines.draw();
    checkBoxesAirlines.selected(mouseX,mouseY);
    checkBoxesAirlines.selectAll(mouseX,mouseY);
    
    checkBoxesDataSet.selectAll(mouseX,mouseY);
    checkBoxesDataSet.draw();
    checkBoxesDataSet.selected(mouseX,mouseY);
  }
}
