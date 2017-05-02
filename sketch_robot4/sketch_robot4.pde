/**
* 初期処理
**/
void setup() {
  size(640, 640);             // Window を描写
  ellipseMode(RADIUS);        // 円の描写モードを？
}

/*
* 描写処理（繰返し実行）
*/
void draw() {
  background(0, 153, 204);
  drawRobot(120, 420, 140, 110);
  drawRobot(270, 460, 95, 260);
  drawRobot(420, 310, 10, 80);
  drawRobot(570, 390, 40, 180);
}

/*
* ロボット描写
* @param x 描写開始するX座標
* @param x 描写開始するY座標
* @param neckHeight 首の高さ
* @param bodyHeight 胴体の高さ
*/
void drawRobot(float x, float y, int neckHeight, int bodyHeight) {
  /* 初期処理 */
  int radius = 45;  // 頭の半径
  strokeWeight(2);

  // 首の位置を決定
  float neckY = y - bodyHeight - neckHeight - radius;
   
  // 首
  stroke(255);                                 // 線を白に
  line(x+2, y-bodyHeight, x+2, neckY);         // 線左
  line(x+12, y-bodyHeight, x+12, neckY);       // 線中央
  line(x+22, y-bodyHeight, x+22, neckY);       // 線右
  
  // アンテナ
  pushMatrix();
  translate(x+12, neckY);
  float angle = -PI/30.0;
  for (int i = 0; i <= 30; i++) {
    line(80, 0, 0, 0);
    rotate(angle);
  }
  popMatrix();
  
  // 胴体
  noStroke();                                  // 線なし
  fill(255, 204, 0);                           // 塗りつぶしをオレンジに
  ellipse(x, y-33, 33, 33);                    // 円半重力
  fill(0);                                     // 塗りつぶしを黒に
  rect(x-45, y-bodyHeight, 90, bodyHeight-33); // 四角形胴体
  fill(255, 204, 0);                           // 塗りつぶしをオレンジに
  rect(x-45, y-bodyHeight+17, 90, 6);          // 四角形胴体
  
  // 頭
  fill(0);                                     // 塗りつぶしを黒に
  ellipse(x+12, neckY, radius, radius);        // 円頭
  fill(255);                                   // 塗りつぶしを白に
  ellipse(x+24, neckY-6, 14, 14);              // 円目
  fill(0);                                     // 塗りつぶしを黒に
  ellipse(x+24, neckY-6, 3, 3);                // 円瞳孔
  fill(153, 204, 255);                         // 塗りつぶしを明るい青に
  ellipse(x, neckY-8, 5, 5);                   // 円小さな目左
  ellipse(x+30, neckY-26, 4, 4);               // 円小さな目中央
  ellipse(x+41, neckY+6, 3, 3);                // 円小さな目右
}