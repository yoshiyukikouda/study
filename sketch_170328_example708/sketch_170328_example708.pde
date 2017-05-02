PFont font;
String quote = "That's one small step for man...";

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  font = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(font);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(102);
  text(quote, 26, 24, 240, 100);
}