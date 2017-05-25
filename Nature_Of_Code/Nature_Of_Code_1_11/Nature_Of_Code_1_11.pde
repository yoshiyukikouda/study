// ベクトル運動：マウスに追従するための加速度計算
Mover[] movers = new Mover[20];

void setup() {
  size(640, 360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  //background(255);
  noStroke();
  fill(255, 60);
  rect(0, 0, width, height);
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}

// 移動オブジェクトクラス
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  
  Mover() {
    // 描写位置と速度の初期値を設定
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topSpeed = 10;
  }
  
  void update() {
    // マウス位置のベクトル
    PVector mouse = new PVector(mouseX, mouseY);
    // マウス位置 - 現在位置の値を求める
    PVector direction = PVector.sub(mouse, location);   
    // ノーマライズ
    direction.normalize();
    // スケーリング
    direction.mult(0.5);
    
    // 加速度として設定
    acceleration = direction;

    // 速度に加速度を加算
    velocity.add(acceleration);
    // 速度の上限を設定
    velocity.limit(topSpeed);
    // 現在位置に速度分の移動を加算
    location.add(velocity);
  }
  
  void display() {
    noStroke();
    fill(255, 0, 0);
    ellipse(location.x, location.y, 16, 16);
  } 

  // ウィンドウ端に到達したかのチェック
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}