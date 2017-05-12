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
  background(0);
  
  translate(mouseX, mouseY);
  rotate(angle);
  rect(-15, -15, 30, 30);

  rotate(angle);
  translate(mouseX, mouseY);
  ellipse(0, 0, 30, 30);

  angle += 0.1;
}