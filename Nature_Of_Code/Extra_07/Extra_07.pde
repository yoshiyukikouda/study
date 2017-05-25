// ベクトル運動：マウスに追従するための加速度計算 + 加速度にパーリンノイズ加算
Mover[] movers = new Mover[50];

void setup() {
  frameRate(60);
  size(500, 500);
  background(255);
  for (int i = 0; i < movers.length; i++) {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    movers[i] = new Mover(r, g, b);
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
  //saveFrame("frames/######.tif");
}

// 移動オブジェクトクラス
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector noiseOff;
  float topSpeed;
  float r, g, b;
  
  Mover(float wr, float wg, float wb) {
    // 描写位置と速度の初期値を設定
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    noiseOff = new PVector(random(1000), random(1000));
    topSpeed = 6;
    r = wr;
    g = wg;
    b = wb;
  }
  
  void update() {
    // マウス位置のベクトル
    PVector mouse = new PVector(mouseX, mouseY);
    // 移動方向（マウス位置 - 現在位置）
    PVector direction = PVector.sub(mouse, location);
    
    // 移動方向の正規化
    direction.normalize();

    // パーリンノイズを加算
    direction.x += map(noise(noiseOff.x), 0, 1, -2, 2);
    direction.y += map(noise(noiseOff.y), 0, 1, -2, 2);

    // スケーリング
    direction.mult(1);
    
    // 加速度として設定
    acceleration = direction;
    
    // ノイズ時間を進行させる
    noiseOff.add(0.5, 0.2);

    // 速度に加速度を加算
    velocity.add(acceleration);
    // 速度の上限を設定
    velocity.limit(topSpeed);
    // 現在位置に速度分の移動を加算
    location.add(velocity);
  }
  
  void display() {
    noStroke();
    fill(r, g, b);
    ellipse(location.x, location.y, 10, 10);
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