import processing.opengl.*;

Cube cube;
float theta = 0.0;

/*
* Setup
*/
void setup() {
  size(480, 480, OPENGL);
  cube = new Cube(20, width, height);

  frameRate(30);
}

/*
* Draw
*/
void draw() {
  background(0);
  pushMatrix();
  translate(width / 2, height / 2, -120);
  rotateX(PI/3);
  rotateZ(theta);
  cube.calculate();
  cube.render();
  popMatrix();
  theta += 0.0025;
  
  saveFrame("frames/######.tif");
}

/*
* Cube Class
*/
class Cube {
  int _cubeSize;
  int _w;
  int _h;
  int _rows;
  int _cols;
  float _rot = 0;
  float _xoff = 0.0;
  float _zoff = 0.0;
  float [][] _z;

  /*
  * Constructor
  */
  Cube(int cubeSize, int w, int h) {
    _cubeSize = cubeSize;
    _w = w;
    _h = h;
    _cols = _w / _cubeSize / 2;
    _rows = _h / _cubeSize / 2;
    _z = new float[_cols][_rows];
  }
  
  /*
  * Add noise three-dimensionally
  */
  void calculate() {
    float xoff = 0.0;
    for (int x = 0; x < _cols; x++) {
      float yoff = 0.0;
      for (int y = 0; y < _rows; y++) {
        _z[x][y] = map(noise(xoff, yoff, _zoff), 0, 1, -120, 120);
        yoff += 0.1;
      }
      xoff += 0.1;
    }
    _zoff += 0.01;
  }

  /*
  * Rendering Methods
  */
  void render() {
    float xspace = 2;
    for (int x = 0; x < _z.length - 1; x++) {
      float yoff = 0.0;
      float yspace = 2;
      for (int y = 0; y < _z[x].length; y++) {
        // Chage Color
        float currentElevation = _z[x][y];
        float currentShade = map(currentElevation, -120, 120, 0, 255);
        fill (currentShade, currentShade, 0, 255);

        // Rendering
        pushMatrix();
        float xPos = ((x + xspace) * _cubeSize) - (_w / 2);
        float yPos = ((y + yspace) * _cubeSize) - (_h / 2);
        translate(xPos, yPos, _z[x][y]);
        rotateX((PI/180)*_rot);
        rotateY((PI/180)*_rot);
        box(_cubeSize);
        popMatrix();
        
        // Count Up of y
        yoff += 0.001;
        yspace += 1;
      }
      // Count Up of x
      xspace += 1;
      _xoff += 0.001;
    }
    // Count Up of Rotate
    _rot++;
  }
}