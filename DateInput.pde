//C.O'Brien, made InputBox class, 3/4/24, 4pm

class InputBox {
  int XPos, YPos, width, height;
  int size = 24;
  int Background = color(200), Foreground = color(0, 0, 0), 
  BackgroundSelected = color(255), Border = color(30, 30, 30);
  boolean BorderEnable = true, selected = false;
  int BorderWeight = 1;
  String Text = "";
  
  InputBox(int x, int y, int w, int h) {
    XPos = x;
    YPos = y;
    width = w;
    height = h;
  }
  
  void draw() {
    fill(selected ? BackgroundSelected : Background);
    // change colours based on if user selected box.
    if (BorderEnable) {
      stroke(Border);
      strokeWeight(BorderWeight);
    } else {
      noStroke();
    }
    rect(XPos, YPos, width, height);
    fill(Foreground);
    textSize(size);
    text(Text, XPos + 5, YPos + height/2 + size/4);
  }
  
  void keyPressed() {
    if (!selected) return;
    // check if user has deleted and delete the text based on it.
    if (key == BACKSPACE && Text.length() > 0) {
      Text = Text.substring(0, Text.length() - 1);
    } else if (key >= ' ' && key <= '~') {
      Text += key;
    }
  }
  
  void mousePressed(int x, int y) {
    selected = x > XPos && x < XPos + width && y > YPos && y < YPos + height;
  }
  
  boolean isSelected() {
    return selected;
  }

  String getText() {
    return Text;
  }
}
  
