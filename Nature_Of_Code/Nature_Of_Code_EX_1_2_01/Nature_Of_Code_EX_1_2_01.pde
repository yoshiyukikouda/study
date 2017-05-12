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
    location.add(random(-1, 1), random(-1, 1));
  }

  void display() {
    stroke(0);
    point(location.x, location.y);
  }
}