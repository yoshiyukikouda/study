PImage img1;
PImage img2;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(480, 120);
  img1 = loadImage("lunar.jpg");
  img2 = loadImage("capsule.jpg");
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  image(img1, -120, 0);
  image(img1, 130, 0, 240, 120);
  image(img2, 300, 0, 240, 120);
}