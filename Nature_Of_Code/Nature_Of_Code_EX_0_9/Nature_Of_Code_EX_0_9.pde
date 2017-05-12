float zoff = 0.0;

void setup () {
  size(480, 480);
}

void draw() {
  loadPixels();
  float xoff = 0.0;
  for (int x = 0; x < width; x++) {
    float yoff = 0.0;
    for (int y = 0; y < height; y++) {
      float bright = noise(xoff, yoff, zoff) * 255;
      pixels[x+y*width] = color(bright, bright, bright);
      yoff += 0.01;
    }
    xoff += 0.01;
  }
  updatePixels();
  zoff += 0.01;
}