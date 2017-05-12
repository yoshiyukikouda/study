float angle = 0.0;
float offset = 60;
float scalar = 40;
float speed = 0.05;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {

  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  
  fill(255);
  ellipse(x, y, 40, 40);
  
  angle += speed;
}