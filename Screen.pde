class Screen {

  ArrayList screenWidgets;
  PApplet parent;
  Screen(PApplet parent) {
    this.parent = parent;
    screenWidgets=new ArrayList();
  }

  void add(Widget w) {
    screenWidgets.add(w);
  }

  void drawWidgets() {
    for (int i = 0; i < screenWidgets.size(); i++) {
      ((Widget)screenWidgets.get(i)).draw();
    }
  }
  
  ArrayList getWidgets() {
    return screenWidgets;
  }
}
