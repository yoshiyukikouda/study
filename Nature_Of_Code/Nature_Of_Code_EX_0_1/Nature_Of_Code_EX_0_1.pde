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
    
    float choice = random(1);
    if (choice <= 0.3) {
      x++;
    } else if (choice <= 0.6) {
      y++;
    } else if (choice <= 0.8) {
      x--;
    } else {
      y--;
    }
    
  }

  void display() {
    stroke(0);
    point(x, y);
  }
}