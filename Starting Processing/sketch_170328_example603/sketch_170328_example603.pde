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
  rotate(mouseX / 100.0);
  rect(-80, -10, 160, 20);
}