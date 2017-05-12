import processing.opengl.*;

float xstart;
float ystart;
float zstart;
float xnoise;
float ynoise;
float znoize;

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
  
  xnoise = xstart;
  ynoise = ystart;

  for (int y = 0; y <= height; y += 5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x += 5) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, 250 - y, -y);
  rotate(noiseFactor * radians(360));
  float sphereSize = noiseFactor * 35;
  float grey = 150 + (noiseFactor * 120);
  float alph = 150 + (noiseFactor * 120);
  fill(grey, alph);
  sphere(sphereSize);
  popMatrix();
}