/* 初期処理 */
PShape bot1;
PShape bot2;
PShape bot3;
PImage landscape;

float easing = 0.05;          // イージングレート
float offset = 0;

/**
* 初期処理
**/
void setup() {
  size(640, 640);             // Window を描写
  bot1 = loadShape("robot1.svg");
  bot2 = loadShape("robot2.svg");
  bot3 = loadShape("robot3.svg");
  landscape = loadImage("clouds.png");
}

/*
* 描写処理（繰返し実行）
*/
void draw() {
  // 背景
  background(255);

  // 左右の間隔を設定し、イージングによって滑らかに移動させる
  float targetOffset = map(mouseX, mouseY, height, -40, 40);
  offset += (targetOffset - offset) * easing;

  // 左側のロボ
  shape(bot1, 85 + offset, 65);

  // 右側のロボ
  float smallerOffset = offset * 0.7;
  shape(bot2, 510 + smallerOffset, 140, 78, 248);

  // 一番小さいロボ
  smallerOffset *= -0.5;
  shape(bot3, 410 + smallerOffset, 225, 39, 124);
}