
//ben bryce 8th april 
class Cutscreen{
  float x = 0;
  int y = 100;
  int time =0;
  int count=0;
  int squarePos;

  
  void draw(PImage image, PImage copy){
    background(255);
    //
    image(image, 400, 300, 100, 100);
    image(image, width/5, width/10, 200, 200);
    image(image, width-400, height/7, width/4, height/4);
    image(copy, width/4, 450, width/2, height/2);
     textSize(25);
     fill(0);
     text("Loading..", 450, 600);
   
     for (int i=0; i < count+1; i++)
     {
       fill(0);
       rect(width/3.3+squarePos, height-167, 35, 35);
       squarePos=squarePos+40;
     }
     squarePos = 0;
    
  }
  
  void move(){
    x=x+1.7;
  }
  
  void addbar(){
    count = count+1;
  }
  
  
}
