// パーリンノイズ + マッピング + ベクトル
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
  PVector timer;

  Walker() {
    timer = new PVector(0, 10000);
    location = new PVector(0, 0);
  }
  
  void step() {
    location.x = map(noise(timer.x), 0, 1, 0, width);
    location.y = map(noise(timer.y), 0, 1, 0, height);
    timer.add(0.01, 0.01);
    
    println("x = " + location.x + "    " + "y = " + location.y);
  }

  void display() {
    stroke(0);
    ellipse(location.x, location.y, 16, 16);
  }
}