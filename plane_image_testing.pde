
//ben bryce 8th april
class Cutscreen {
  int bars;
  int currentBars = 0;


  Cutscreen(int bars) {
    this.bars = bars;
  }

  void draw() {
    //background(255);

    textSize(25);
    fill(0);
    textAlign(CENTER);

    text("Loading..", width/2, height/2);

    for (int i=0; i <= currentBars; i++)
    {
    }
    currentBars++;
  }
}
