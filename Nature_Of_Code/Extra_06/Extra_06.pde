// ベクトル運動：速度
Mover[] movers = {};
int count = 50;

void setup() {
  frameRate(30);
  size(500, 500, P3D);
  for (int i = 0; i < count; i++) {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    Mover mover = new Mover(r, g, b);
    movers = (Mover[])append(movers, mover);
  }
}

void draw() {
  background(255);
  pushMatrix();
  translate(0, 0, -500);
  //rotateX(PI/4);
  noStroke();
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
  popMatrix();
  saveFrame("frames/######.tif");
}

// 移動オブジェクトクラス
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  float _r , _g, _b;
  
  Mover(float r, float g, float b) {
    // 描写位置と速度の初期値を設定
    location = new PVector(width / 2, height / 2, 0);
    velocity = new PVector(0, 0, 0);
    topSpeed = 10;
    _r = r;
    _g = g;
    _b = b;
  }
  
  void update() {
    // 加速度、加速度の上限
    acceleration = PVector.random3D();
    acceleration.mult(random(2));
    // 速度に加速度を加算
    velocity.add(acceleration);
    // 速度の上限を設定
    velocity.limit(topSpeed);
    // 現在位置に速度分の移動を加算
    location.add(velocity);
    println(location);
  }
  
  void display() {
    noStroke();
    fill(_r, _g, _b);
    pushMatrix();
    translate(location.x, location.y, location.z);
    ellipse(0, 0, 20, 20);
    popMatrix();
  } 

  // ウィンドウ端に到達したかのチェック
  void checkEdges() {
    if (location.x > width || location.x < 0) {
      velocity.x *= -1;
    }

    if (location.y > height || location.y < 0) {
      velocity.y *= -1;
    }

    if (location.z > 600 || location.z < 0) {
      velocity.z *= -1;
    }
  }
}