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
  PVector location;

  Walker() {
    location = new PVector();
    location.x = width / 2;
    location.y = height / 2;
  }
  
  void step() {
    float r = random(1);
    if (r <= 0.4) {
      location.add(1, 0);
    } else if (r <= 0.6) {
      location.add(-1, 0);
    } else if (r <= 0.8) {
      location.add(0, 1);
    } else {
      location.add(0, -1);
    }
  }

  void display() {
    stroke(0);
    point(location.x, location.y);
  }
}