// ベクトルを使用した場合のボール移動
PVector location;
PVector velocity;

void setup() {
  size(640, 360);
  background(255);
  location = new PVector(100, 100);  // 位置
  velocity = new PVector(1, 3.3);    // 速度
}

void draw() {
  // 初期化
  background(255);
  
  // 現在位置に速度分の移動を加算
  location.add(velocity);
  
  // 画面端に到達したら方向転換
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }
  
  // 図形描写
  stroke(0);
  fill(175);
  ellipse(location.x, location.y, 16, 16);
}

// 以下はProcessingですでに実装済
///*
//* ベクトルクラス
//*/
//class PVector {
//  float x, y;
//  PVector(float _x, float _y) {
//    x = _x;
//    y = _y;
//  }
  
//  void add(PVector velocity){
//    x += velocity.x;
//    y += velocity.y;
//  }
//}