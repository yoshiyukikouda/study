int time1 = 2000;
int time2 = 4000;
float x = 0;

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
  int currentTime = millis();
  background(204);
  if (currentTime > time2) {
    x -= 0.5;
  } else if (currentTime > time1) {
    x += 2;
  }
  println(currentTime);
  ellipse(x, 60, 90, 90);
}