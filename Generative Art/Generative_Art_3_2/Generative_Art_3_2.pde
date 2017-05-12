float xstep = 10;
float ystep = 10;
float lastx = -999;
float lasty = -999;
float y = 50;

void setup() {
  size(500, 100);
  
  strokeWeight(5);
  
  stroke(20, 50, 70);
  line(20, 50, 480, 50);

  stroke(75);
  for (int x = 20; x <= 480; x += xstep) {
    ystep = random(-10, 10);
    y += ystep;
    line(x, y, lastx, lasty);
    lastx = x;
    lasty = y;
  }
}