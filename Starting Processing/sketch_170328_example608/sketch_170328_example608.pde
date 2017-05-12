float angle = 0;
float angleDirection = 1;
float speed = 0.005;

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
  translate(mouseX, mouseY);
  float scaler = mouseX / 100.0;
  scale(scaler);
  strokeWeight(1.0 / scaler);
  rect(-15, -15, 30, 30);
}