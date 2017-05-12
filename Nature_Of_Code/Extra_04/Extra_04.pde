import processing.opengl.*;

Cube cube;
float theta = 0.0;

void setup() {
  size(480, 480, OPENGL);
  cube = new Cube(20, width, height);
  //frameRate(30);
}

void draw() {
  background(0);
  pushMatrix();
  translate(width / 2, height / 2, 0);
  rotateX(PI/3);
  rotateY(theta);
  rotateZ(theta);
  cube.render();
  popMatrix();
  theta += 0.0025;
  
  //saveFrame("frames/######.tif");
}

class Cube {
  int _cubeSize;
  int _w;
  int _h;
  float _rot = 0;
  float _xoff = 0.0;
  float _zoff = 0.0;

  Cube(int cubeSize, int w, int h) {
    _cubeSize = cubeSize;
    _w = w;
    _h = h;
  }
  
  void render() {
    for (int x = 40; x < width - 40; x += 40) {
      float yoff = 0.0;
      for (int y = 40; y < height - 40; y += 40) {
        // Cubeの色変更
        float r = map(noise(_xoff, yoff), 0, 1, 0, 255);
        float g = map(noise(_xoff + 100, yoff), 0, 1, 0, 255);
        float b = map(noise(_xoff, yoff + 100), 0, 1, 0, 255);
        fill(r, g, b);

        // 図形描写
        pushMatrix();
        float xPos = x - _w / 2;
        float yPos = y - _h / 2;
        translate(xPos, yPos, 0);
        rotateX((PI/180)*_rot);
        rotateY((PI/180)*_rot);
        box(_cubeSize);
        popMatrix();
        yoff += 0.001;
      }
      _xoff += 0.001;
    }
    _rot++;
  }
}