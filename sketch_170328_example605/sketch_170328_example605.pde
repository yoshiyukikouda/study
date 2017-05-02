float angle = 0;

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
  rotate(angle);
  rect(-15, -15, 30, 30);
  angle += 0.1;
}