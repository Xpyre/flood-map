public class Grid{
  boolean grid;
  public Grid(){
  grid = false;
}
  public void draw(){
    if (grid == false) {
    for ( int i = 0; i < rows; i++) {
      for (int j = 0; j < colums; j++) {
        fill(0, 255, 0);   
        rect(j*width/colums, i * height/rows, 50, 50);
        fill(0);
        grid = true;
      }
    }
  }
  }
}
