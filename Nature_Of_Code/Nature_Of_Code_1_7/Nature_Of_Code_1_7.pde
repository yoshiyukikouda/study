// ベクトル運動：速度
Mover mover;

void setup() {
  size(640, 360);
  mover = new Mover();
}

void draw() {
  //background(255);
  noStroke();
  fill(255, 64);
  rect(0,0,width,height);
  mover.update();
  mover.checkEdges();
  mover.display();
}

// 移動オブジェクトクラス
class Mover {
  PVector location;
  PVector velocity;
  
  Mover() {
    // 描写位置と速度の初期値を設定
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2, 2), random(-2, 2));
  }
  
  void update() {
    // 現在位置に速度分の移動を加算
    location.add(velocity);
  }
  
  void display() {
    stroke(0);
    fill(175);
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