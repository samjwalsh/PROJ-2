Filter newFilter;
int screenX = 1200; //1200
int screenY = 800;
ArrayList <DataPoint> data;

void settings() {
  size(screenX, screenY);
}
void setup() {
  DataReader dataReader = new DataReader("flights2k.csv");
  data = dataReader.filterData("");
  //ArrayList<DataPoint> data = dataReader.filterData("");
  println(data.size());
  colGetter getter = new colGetter(data);
  
}

void draw() {
  //rect(50, 50, 50, 50);
}
