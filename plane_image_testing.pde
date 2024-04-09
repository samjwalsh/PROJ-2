
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
    println("new bar");
    textAlign(CENTER);

    text("Loading..", width/2, height/2);

    for (int i=0; i <= currentBars; i++)
    {
      println("d");
      //rect(50*i, 200, 50, 50);
      println(currentBars);
    }
    currentBars++;
  }
}
