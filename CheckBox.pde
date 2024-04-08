// C. Quinn, Created class for filter screen, 11:30, 29/03/2024

class CheckBox {
  int x, y, count, changingY, selectAllXPos;
  color selectedColour;
  boolean selectAll;
  boolean multiSelect, scroll;
  boolean[] selected;
  String title;
  String[] lables;
  int[] yValues;
  int countTrue, initalY;


  CheckBox(int x, int y, int count, color selectedColour, String title, String[] lables, boolean multiSelect, boolean scroll) {
    this.x = x;
    this.y = y;
    this.count = count;
    this.selectedColour = selectedColour;
    this.title = title;
    this.lables = lables;
    this.multiSelect =multiSelect;
    this.scroll = scroll;
    initalY = y;
    selected = new boolean[count];
    yValues = new int[count];
    //changingY = y+20;
    for (int i = 0; i < selected.length; i++) {
      if (multiSelect) {
        selected[i] = true;
      } else {
        selected[i] = false;
        selected[0] = true;
      }
    }

    if (multiSelect) {
      selectAll = true;
    } else {
      selectAll = true;
    }

    if (title.equals("Airlines")) {
      selectAllXPos = x+115;
    } else {
      selectAllXPos = x+125;
    }
    countTrue = count;
  }

  void draw() {
    changingY = y+20;
    for (int i = 0; i < selected.length; i++) {
      yValues[i] = changingY;
      changingY+=30;
    }
    textFont(font);
    if (countTrue == count) {
      selectAll = true;
    } else {
      selectAll = false;
    }
    fill(255);
    if (multiSelect) {
      ellipse(selectAllXPos+80, initalY+5, 15, 15);
      if (selectAll) {
        if (dist(mouseX, mouseY, selectAllXPos+80, initalY+5)<15) {
          stroke(255);
        } else stroke(0);
        fill(selectedColour);
        ellipse(selectAllXPos+80, initalY+5, 10, 10);
      }
    }
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(title, x, y);
    textSize(15);
    if (multiSelect) {
      if (scroll) {
        text("Select All", selectAllXPos, initalY+10);
      } else {
        text("Select All", selectAllXPos, y);
      }
    }
    for (int i = 0; i<selected.length; i++) {
      fill(255);
      stroke(0);
      ellipse(x, yValues[i], 15, 15);
      fill(0);
      text(lables[i], x+20, yValues[i]+4);
      if (selected[i]) {
        if (dist(mouseX, mouseY, x, yValues[i])<15) {
          stroke(255);
        } else stroke(0);
        fill(selectedColour);
        ellipse(x, yValues[i], 10, 10);
        stroke(0);
      }
    }
  }



  void mousePressed(int mx, int my) {
    if (multiSelect) {
      if (dist(mx, my, selectAllXPos+80, initalY+5)<8) {
        if (countTrue == count) {
          countTrue = 0;
          for (int i = 0; i<selected.length; i++) {
            selected[i] = false;
          }
        } else {
          countTrue = count;
          for (int i = 0; i<selected.length; i++) {
            selected[i] = true;
          }
        }
      }
    }
    for (int i = 0; i<selected.length; i++) {

      if (dist(mx, my, x, yValues[i])<8) {
        if (!multiSelect) {
          for (int j = 0; j<selected.length; j++) {
            selected[j] = false;
            countTrue--;
          }
        }
        if (selected[i] && multiSelect) {
          selected[i]=false;
          countTrue--;
        } else {
          selected[i]=true;
          countTrue++;
        }
      }
    }
  }
  void needMouseWheel(float e) {
    if (scroll) {
      if (e>0) {
        y-=30;
      }
      if (e<0 && y<initalY) {
        y+=30;
      }
    }
  }
}
