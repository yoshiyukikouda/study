// ベクトル運動：速度
Mover mover;

void setup() {
  size(640, 360);
  mover = new Mover();
}

void draw() {
  //background(255);
  noStroke();
  fill(255, 60);
  rect(0,0,width,height);
  mover.update();
  mover.checkEdges();
  mover.display();
}

// 移動オブジェクトクラス
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector noiseOff;
  float topSpeed;
  
  Mover() {
    // 描写位置と速度の初期値を設定
    location = new PVector(width / 2, height / 2);
    velocity = new PVector();
    acceleration = new PVector();
    noiseOff = new PVector(random(1000), random(1000));
    topSpeed = 10;
  }
  
  void update() {
    // 加速度、加速度の上限
    acceleration.x = map(noise(noiseOff.x), 0, 1, -1, 1);
    acceleration.y = map(noise(noiseOff.y), 0, 1, -1, 1);
    acceleration.mult(0.1);
    noiseOff.add(0.01, 0.01, 0);
    
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