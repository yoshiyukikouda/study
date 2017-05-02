PFont font;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  font = createFont("SourceCodePro-Regular.ttf", 32);
  textFont(font);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(204);
  textSize(32);
  text("That's one small step for man...", 25, 60);
  textSize(16);
  text("That's one small step for man...", 27, 90);
}