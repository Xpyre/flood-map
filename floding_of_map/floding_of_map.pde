Grid grid;
int[][] numbers = new int[10][10];
int r, g, b;
int dr, dg, db;
int rows = 10;
int colums = 10;
int mx;
int my;
int rain = -100;
int damnx, damny;
PImage strtScreen;
boolean damned = false;
boolean p = false;
boolean started = false;
void setup() {
  size (500, 500);
  strtScreen = loadImage("flood map.png");
  grid = new Grid();
  for ( int i = 0; i < rows; i++) {
    for (int j = 0; j < colums; j++) {
      numbers[i][j] = 200;
    }
  }

  r= 0;
  g= 255;
  b= 0;
}

void draw() {
  if (started == false){
  background(strtScreen);
  }
  if(started){
  grid.draw();
  if (p == true && rain < numbers[my][mx]) { 
    fill(r, g, b);
    rect(mx*50, my*50, 50, 50);
    fill(0);
    // text(numbers[my][mx], (mx*width /colums) + (width/colums)/2, (my *height /rows) + (height/rows)/2);
  }
  if (damned == true && rain < numbers[my][mx]) {
    fill(dr, dg, db);

    numbers[damny][damnx] = 900 ;

    rect(damnx*50, damny*50, 50, 50);
    //fill(0,255,0);
    //rect(damnx*50,damny*50,50,50);
  }
  }
}
public void keyPressed() {
  if(started){
  p = true;
  if (key == 's') {
    my = int(mouseY/50);
    mx = int(mouseX/50);

    numbers[my][mx] += -60 ;

    g = numbers[my][mx] / 10;
    b = numbers[my][mx] / 5 ;
    r = numbers[my][mx] / 2 ;
  }



  if (key == 'w') {
    my = int(mouseY/50);
    mx = int(mouseX/50);

    numbers[my][mx] += 50 ;


    g = numbers[my][mx] / 5;
    b = numbers[my][mx] / 10 ;
    r = numbers[my][mx] / 2 ;
  }


  if (key == 'd') {
    my = int(mouseY/50);
    mx = int(mouseX/50);

    numbers[my][mx] = 900 ;

    g = 255;
    b = 255 ;
    r = 255 ;

    if (int(mouseX/50) + 1 < 9) {
      damny = int(mouseY/50);
      damnx = int(mouseX/50) +1 ;
      dg = 255;
      db = 0 ;
      dr = 0 ;
      damned = true;
    }
  }
  if (key == 'a') {
    my = int(mouseY/50);
    mx = int(mouseX/50);

    numbers[my][mx] = 900 ;

    g = 255;
    b = 255 ;
    r = 255 ;

    if (int(mouseX/50)  != 0) {
      damny = int(mouseY/50);
      damnx = int(mouseX/50) -1 ;
      dg = 255;
      db = 0 ;
      dr = 0 ;
      damned = true;
    }
  }
  if (key == 'z') {
    my = int(mouseY/50);
    mx = int(mouseX/50);

    numbers[my][mx] = 900 ;

    g = 255;
    b = 255 ;
    r = 255 ;
    if (int(mouseY/50) + 1< 9) {
      damny = int(mouseY/50)+1;
      damnx = int(mouseX/50)  ;
      dg = 255;
      db = 0 ;
      dr = 0 ;
      damned = true;
    }
  }
  if (key == 'x') {
    my = int(mouseY/50);
    mx = int(mouseX/50);
    numbers[my][mx] = 900 ;
    g = 255;
    b = 255 ;
    r = 255 ;
    if (int(mouseY/50) != 0) {
      damny = int(mouseY/50)-1;
      damnx = int(mouseX/50)  ;
      dg = 255;
      db = 0 ;
      dr = 0 ;
      damned = true;
    }
  }
  }
}

void mousePressed() {
  if(started == false){
  started = true;
  }
  if(started){
  rain += 100;
  for ( int i = 0; i < rows; i++) {
    for (int j = 0; j < colums; j++) {
      if (rain >= numbers[i][j]) {
        fill(0, 0, 255);
        rect(j*50, i*50, 50, 50);
      }
    }
  }
  }
}
