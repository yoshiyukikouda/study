Landscape landscape;    
float theta = 0.0;

void setup() {
  size(600, 600, P3D);
  landscape = new Landscape(20, 600, 600);
}

void draw() {
  background(255);
  pushMatrix();
  translate(width / 2, height / 2, -160);
  rotateX(PI/3);
  //rotateZ(theta);
  landscape.calculate();
  landscape.render();
  popMatrix();
  theta += 0.0025;
}

class Landscape {
  int _cellSize;
  int _w;
  int _h;
  int _rows;
  int _cols;
  float _zoff = 0.0;
  float [][] _z;  // 3次元の移動ノイズを格納する2次元配列
  
  Landscape(int cellSize, int w, int h) {
    _cellSize = cellSize;
    _w = w;
    _h = h;
    _cols = _w/_cellSize;
    _rows = _h/_cellSize;
    _z = new float[_cols][_rows];
  }
  
  // 3次元ノイズを加える処理
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
  
  // 図形のレンダリング
  void render() {
    for (int x = 0; x < _z.length - 1; x++) {
      beginShape(QUAD_STRIP);
      for (int y = 0; y < _z[x].length; y++) {
        stroke(0);
        float currentElevation = _z[x][y];
        float currentShade = map(currentElevation, -120, 120, 0, 255);
        fill (currentShade, 255);
        float xPos = x * _cellSize - _w / 2;
        float yPos = y * _cellSize - _h / 2;
        vertex(xPos, yPos, _z[x][y]);
        vertex(xPos + _cellSize, yPos, _z[x+1][y]);
      }
      endShape();
    }
  }
}