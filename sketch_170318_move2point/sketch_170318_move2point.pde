int startX = 20;
int stopX = 360;
int startY = 30;
int stopY = 240;
float x = startX;
float y = startY;
float step = 0.005;
float pct = 0.0;

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
  if (pct < 1.0) {
    x = startX + ((stopX - startX) * pct);
    y = startY + ((stopY - startY) * pct*pct*4);
    pct += step;
  }
  ellipse(x, y, 20, 20);
}