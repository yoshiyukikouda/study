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
  background(0);
  
  float y1 = offset + sin(angle) * scalar;
  float y2 = offset + sin(angle * 0.4) * scalar;
  float y3 = offset + sin(angle * 0.8) * scalar;
  
  ellipse(80, y1, 40, 40);
  ellipse(120, y2, 40, 40);
  ellipse(160, y3, 40, 40);
  
  angle += speed;
}