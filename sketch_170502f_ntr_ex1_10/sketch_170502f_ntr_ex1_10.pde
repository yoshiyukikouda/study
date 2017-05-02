import processing.opengl.*;

float rot = 0;
float xoff = 0.0;
float zoff = 0.0;

void setup() {
  size(480, 480, OPENGL);
}

void draw() {
  background(0);
  rotateX(rot);
  rotateY(rot);
  for (int x = 50; x < width; x += 50) {
    float yoff = 0.0;
    for (int y = 50; y < height; y += 50) {
      float r = map(noise(xoff, yoff), 0, 1, 0, 255);
      float g = map(noise(xoff + 100, yoff), 0, 1, 0, 255);
      float b = map(noise(xoff, yoff + 100), 0, 1, 0, 255);
      fill(r, g, b);
      pushMatrix();
      translate(x, y, -50);
      box(20);
      popMatrix();
      yoff += 0.01;
    }
    xoff += 0.01;
  }
  rot += 0.01;
}