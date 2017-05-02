Door[] doors = new Door[10];
int x = 50;
int y = 50;

void setup() {
  size(320, 320, P3D);
  for (int i = 0; i < doors.length; i++) {
    doors[i] = new Door();
  }
}

void draw() {
  //randomSeed(0);
  background(128);
  for (Door d : doors) {
    d.display(x, y);
  }
}

class Door {
  float t = 0;
  float d = PI/60;
  void  display(int tempX, int tempY) {
    translate(tempX, tempY);
    rotateY(t);
    t += d;
    rect(-36, -36, 62, 62);
  }
}