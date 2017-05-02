float angle = 0;
float x = 0;
float y = 0;
float prevx = 0;
float prevy = 0;

void setup() {
  size(500, 500);
}

void draw() {
  stroke(1);
  x++;
  float radians = radians(angle);
  y = (height / 2) + (cos(radians) * 100);
  angle = angle + 2; 
  line(prevx, prevy, x, y);
  prevx = x;
  prevy = y;
}