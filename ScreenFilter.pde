// C. Quinn, Created class for filter screen, 11:30, 29/03/2024

class ScreenFilter extends Screen {
  InputBox startDateInput, endDateInput;


  ScreenFilter(PApplet parent) {
    super(parent);
    add(new Widget(20, height-60, 100, 40,
      "Home", color(255), font, "Home"));
    startDateInput = new InputBox(500, 200, 200, 50);
    endDateInput = new InputBox(500, 280, 200, 50);
  }

  void draw() {
    background(255, 212, 229);
    pages.draw();
    startDateInput.draw();
    endDateInput.draw();
    fill(0);
    textSize(16);
    textAlign(LEFT, CENTER);
    text("Start Date:", startDateInput.XPos - 82,
      startDateInput.YPos + startDateInput.height / 2);
    text("End Date:", endDateInput.XPos - 80,
      endDateInput.YPos + endDateInput.height / 2);
    drawWidgets();

    slider.draw();
    slider.update(mouseX, mouseY);

    checkBoxesAirlines.draw();

    checkBoxesDataSet.draw();
  }
  void mousePressed() {
    startDateInput.mousePressed(mouseX, mouseY);
    endDateInput.mousePressed(mouseX, mouseY);
    pages.mousePressed();
  }
  void keyPressed() {
    startDateInput.keyPressed();
    endDateInput.keyPressed();
  }
}
