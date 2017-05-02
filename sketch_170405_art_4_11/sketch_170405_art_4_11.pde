float _angleNoise;
float _radiusNoise;
float _xnoise;
float _ynoise;
float _angle = -PI/2;
float _radius;
float _strokeCol = 254;
int _strokeChange = -1;

void setup() {
  size(500, 500);
  smooth();
  frameRate(30);
  background(255);
  noFill();
  
  _angleNoise = random(10);
  _radiusNoise = random(10);
  
  stroke(0, 30);
  strokeWeight(1);
}

void draw() {  
  // 半径にノイズを加える
  _radiusNoise += 0.005;
  _radius = (noise(_radiusNoise) * 550) + 1;
  
  // 角度にノイズを加える
  _angleNoise += 0.005;
  _angle += (noise(_angleNoise) * 6) - 3;
  if (_angle > 360) {
    _angle -= 360;
  }
  if (_angle < 0) {
    _angle += 360;
  }

  // 中点にノイズを加える
  _xnoise += 0.01;
  _ynoise += 0.01;
  float centerx = width/2 + (noise(_xnoise) * 100) - 50;
  float centery = width/2 + (noise(_ynoise) * 100) - 50;
  
  // 円のx, y座標取得
  float rad = radians(_angle); 
  float x1 = centerx + (_radius * cos(rad));
  float y1 = centery + (_radius * sin(rad));

  // 円の反対側の座標取得
  float opprad = rad + PI;
  float x2 = centerx + (_radius * cos(opprad));
  float y2 = centery + (_radius * sin(opprad));
  
  // 線の色変え
  //float r = random(255);
  //float g = random(255);
  //float b = random(255);
  //float weight = random(1, 10);
  //strokeWeight(weight);
  //stroke(r, g, b, 60);
  _strokeCol += _strokeChange;
  if (_strokeCol > 254) {
    _strokeChange = -1;
  }
  if (_strokeCol < 0) {
    _strokeChange = 1;
  }
  stroke(_strokeCol, 60);

  // 線の描写
  line(x1, y1, x2, y2);
}