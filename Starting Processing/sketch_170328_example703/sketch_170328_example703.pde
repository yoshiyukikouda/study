PImage img1;
PImage img2;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  img1 = loadImage("lunar.jpg");
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(0);
  image(img1, 0, 0, mouseX * 2, mouseY * 2);
}