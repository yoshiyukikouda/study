import processing.opengl.*;

float rotX = 0;
float flag = 1;
float boxsize = 5;

void setup () {
  smooth();
  size(480, 480, OPENGL);
  frameRate(30);
}


void draw() {
  background(0);

  ambientLight(63, 31, 31);
  directionalLight(255,255,255,-1,0,0);
  pointLight(63, 127, 255, mouseX, mouseY, 200);
  spotLight(100, 100, 100, mouseX, mouseY, 200, 0, 0, -1, PI, 2);
  
  translate(width / 2, height / 2, -20);
  //rotateX(rotX);
  //rotateY(rotX * 2);
  //rotateZ(rotX);
  for (int x = -width/2 + 50; x < width/2 - 50; x += 20) {
    for (int y = -height/2 + 50; y < height/2 - 50; y += 20) {
      Cube cube = new Cube(x, y);
      cube.drawCube();
    }
  }
  rotX += 0.01;
}

class Cube {
  float x, y;
  
  Cube(float wx, float wy) {
    x = wx;
    y = wy;
  }
  
  void drawCube() {
    noStroke();
    pushMatrix();
    translate(x, y, 0);
    //rotateX(1);
    rotateY(1);
    fill(255, 190);
    box(boxsize);
    if (boxsize > 20) {
      flag = -1;
    } else if(boxsize < 2) {
      flag = 1;
    }
    boxsize += (0.002 * flag);
    popMatrix();
  }
}