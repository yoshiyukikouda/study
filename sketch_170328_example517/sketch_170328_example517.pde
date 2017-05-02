/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  textSize(64);
  textAlign(CENTER);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(0);
  text(key, 60, 80);
}