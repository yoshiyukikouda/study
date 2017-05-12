import processing.opengl.*;

float xstart;
float ystart;
float zstart;
float xnoise;
float ynoise;
float znoise;

int sideLength = 200;
int spacing = 5;

void setup() {
  size(300, 300, P3D);
  smooth();
  background(0);
  sphereDetail(8);
  noStroke();
  xstart = random(10);
  ystart = random(10);
  zstart = random(10);
}

void draw() {
  background(0);
  
  xstart += 0.01;
  ystart += 0.01;
  zstart += 0.01;
  
  xnoise = xstart;
  ynoise = ystart;
  znoise = zstart;
  
  translate(150, 20, -150);

  rotateZ(frameCount * 0.1);
  rotateY(frameCount * 0.1);

  for (int z = 0; z <= sideLength; z += spacing) {
    znoise += 0.1;
    ynoise = ystart;
    for (int y = 0; y <= sideLength; y += spacing) {
      ynoise += 0.1;
      xnoise = xstart;
      for (int x = 0; x <= sideLength; x += spacing) {
        xnoise += 0.1;
        drawPoint(x, y, z, noise(xnoise, ynoise, znoise));
      }
    }
  }
}

void drawPoint(float x, float y, float z, float noiseFactor) {
  pushMatrix();
  translate(x, y, z);
  rotate(noiseFactor * radians(360));
  float grey = noiseFactor * 255;
  fill(grey, 10);
  box(spacing, spacing, spacing);
  popMatrix();
}