// C. Quinn, Created class for list with checkboxes, 11:30, 29/03/2024

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

    // set values of initial boolean array
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
    // position select all button
    if (title.equals("Airlines")) {
      selectAllXPos = x+115;
    } else {
      selectAllXPos = x+125;
    }
    countTrue = count;
  }

  ArrayList<String> getSelected() {
    ArrayList<String> selectedAL = new ArrayList<String>();
    for (int item = 0; item < lables.length; item++) {
      if (selected[item]) selectedAL.add(lables[item]);
    }
    return selectedAL;
  }
  void draw() {
    changingY = y+20;
    // array of y positions of list items
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
    // multi select & select all buttons
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
    // write title
    text(title, x, y);
    textSize(15);

    // if widget can scroll, select all button is fixed
    if (multiSelect) {
      if (scroll) {
        text("Select All", selectAllXPos, initalY+10);
      } else {
        text("Select All", selectAllXPos, y);
      }
    }

    // print checkbox with label
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
    // textAlign(CENTER);
  }



  void mousePressed(int mx, int my) {
    // change the boolean array if airport is selected or deselected
    if (multiSelect) { // select all button
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
    // scroll up or down
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
