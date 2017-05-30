// 力：重力、風力（浮力）
Mover movers[] = new Mover[100];

/*
* 初期設定
*/
void setup() {
  size(640, 360);
  for (int i = 0; i < movers.length; i++)
  {
    movers[i] = new Mover(random(0.1, 5), 0, 0, random(0, 255), random(0, 255), random(0, 255));
  }
}

/*
* 随時描写
*/
void draw() {
  noStroke();
  //background(255);
  fill(255, 60);
  rect(0, 0, width, height);

  // 表示更新
  for (int i = 0; i < movers.length; i++) {
    float m = movers[i].mass;
    // 風力
    PVector wind = new PVector(0.01, 0);
    // 重力
    PVector gravity = new PVector(0, 0.1 * m);
    
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}

/*
* 移動オブジェクトクラス
*/
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float r,g,b;
  
  /*
  * コンストラクタ
  */
  Mover(float m, float x, float y, float r_, float g_, float b_) {
    // 質量、位置、速度、加速度の初期値を設定
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    r = r_;
    g = g_;
    b = b_;
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
    fill(r, g, b);
    ellipse(location.x, location.y, mass * 16, mass * 16);
  } 

  /*
  * ウィンドウ端に到達した場合の処理
  */
  void checkEdges() {
    if (location.x > width ) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    } 

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
  
  /*
  * 力の積算
  */
  void applyForce(PVector force) 
  {
    // 加速度に力を加算
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
}