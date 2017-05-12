Walker walker;

void setup() {
  size(640, 480);
  walker = new Walker();
  background(255);
}

void draw() {
  walker.step();
  walker.display();
}

class Walker {
  float x;
  float y;
  
  Walker() {
    x = width / 2;
    y = height / 2;
  }
  
  void step() {
    
    float r = random(1);
    if (r <= 0.4) {
      x++;
    } else if (r <= 0.6) {
      x++;
    } else if (r <= 0.8) {
      y--;
    } else {
      y--;
    }
    
  }

  void display() {
    stroke(0);
    point(x, y);
  }
}