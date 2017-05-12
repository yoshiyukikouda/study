/* 初期処理 */
PShape bot1;
float x = 0;

/**
* 初期処理
**/
void setup() {
  size(720, 480);             // Window を描写
  bot1 = loadShape("robot1.svg");
  frameRate(30);
}

/*
* 描写処理（繰返し実行）
*/
void draw() {
  // 背景
  background(0, 153, 204);
  translate(x, 0);

  // 左側のロボ
  shape(bot1, 0, 80);

  // フレームを保存
  saveFrame("frames/######.tif");
  x += 12;
  if (frameCount > 60) {
    exit();
  }
}