// 力：重力、風力（浮力）
Mover mover;
float bPower;

/*
* 初期設定
*/
void setup() {
  size(640, 360);
  mover = new Mover();
  // 浮力の初期値は-1.2
  bPower = -1.2;
}

/*
* 随時描写
*/
void draw() {
  noStroke();
  fill(255, 60);
  rect(0, 0 , width, height);

  // 重力 0.5固定で常に発生
  PVector gravity = new PVector(0, 1);
  mover.applyForce(gravity);

  // 浮力 -1.2開始　⇒　風船の空気が抜けたら弱まるから、少しずつ弱める？
  PVector buoyancy = new PVector(0, bPower);
  mover.applyForce(buoyancy);
  //if (bPower <= 0)
  //{
  //  bPower += 0.0001;
  //}

  // 風力の加算はマウスプレス時のみ　⇒　ランダム
  PVector noff = new PVector(noise(random(1000)), noise(random(1000)));
  if (mousePressed == true) {
    // 風力 パーリンノイズ値を定期的に加算 -0.5～0.5 の間でランダム
    float noiseX = map(noff.x, 0, 1, -0.5, 0.5);
    float noiseY = map(noff.y, 0, 1, -0.5, 0.5);
    PVector wind = new PVector(noiseX, noiseY);
    // 風力を加算
    mover.applyForce(wind);
  }
  // パーリンノイズタイムの加算
  noff.add(0.01, 0.01);
  
  // 表示更新
  mover.update();
  mover.checkEdges();
  mover.display();
}

/*
* 移動オブジェクトクラス
*/
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  /*
  * コンストラクタ
  */
  Mover() {
    // 描写位置と速度の初期値を設定
    location = new PVector(width / 2, height / 2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  /*
  * 位置、速度の更新
  */
  void update() {
    // 速度に加速度を加算
    velocity.add(acceleration);
    // 現在位置に速度分の移動を加算
    location.add(velocity);
    // 加速度の初期化
    acceleration.mult(0);
  }
  
  /*
  * 画面表示
  */
  void display() {
    noStroke();
    fill(255, 0, 0);
    ellipse(location.x, location.y, 20, 20);
  } 

  /*
  * ウィンドウ端に到達した場合の処理
  */
  void checkEdges() {
    if (location.x > width || location.x < 0) {
      velocity.x *= -1;
    }

    if (location.y > height || location.y < 0) {
      velocity.y *= -1;
    }
  }
  
  /*
  * 力の積算
  */
  void applyForce(PVector force) 
  {
    // 加速度に力を加算
    acceleration.add(force);
  }
}