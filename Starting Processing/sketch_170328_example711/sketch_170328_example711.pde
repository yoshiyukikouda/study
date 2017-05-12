PShape dino;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  dino = createShape();
  dino.beginShape();
  dino.fill(153, 176, 180);
  dino.vertex(50, 120);
  dino.vertex(100, 90);
  dino.vertex(110, 60);
  dino.vertex(80, 20);
  dino.vertex(210, 60);
  dino.vertex(160, 80);
  dino.vertex(200, 90);
  dino.vertex(140, 100);
  dino.vertex(130, 120);
  dino.endShape();
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(102);
  translate(mouseX - 120, 0);
  shape(dino, 0, 0);
}