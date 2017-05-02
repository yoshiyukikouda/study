int x = 320;
int y = 320;
int radius  = 12;


void setup() {
  size(640, 640);
  ellipseMode(RADIUS);
  noStroke();
}


void draw() {
  background(204);
  float d = dist(mouseX, mouseY, x, y);
  
  if (d < radius) {
    radius++;
    fill(0);
  } else {
    if (radius > 12) {
      radius--;
    }
    fill(255);
  }
  ellipse(x, y, radius, radius);
}