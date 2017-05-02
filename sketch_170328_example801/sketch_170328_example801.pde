int radius = 40;
float x = -radius;
float speed = 0.5;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(240, 120);
  ellipseMode(RADIUS);
  //frameRate(30);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(0);
  x += speed;
  arc(x, 60, radius, radius, 0.52, 5.76);
}