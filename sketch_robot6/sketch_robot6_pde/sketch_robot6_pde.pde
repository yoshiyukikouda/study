/* 初期処理 */
float angle = 0.0;            // 動きの角度
float x = 180;                // X位置
float y = 400;                // Y位置
float radius = 45;            // 頭の半径
float neckHeight = 56;        // 首の高さ
float bodyHeight = 153;       // 胴体の高さ

/**
* 初期処理
**/
void setup() {
  size(640, 640);             // Window を描写
  ellipseMode(RADIUS);        // 円の描写モードを？
  background(0, 153, 204);
}

/*
* 描写処理（繰返し実行）
*/
void draw() {
  x += random(-4, 4);
  y += random(-1, 1);

  neckHeight = 80 + sin(angle) * 30;
  angle += 0.05;
  
  // 首の位置を決定
  float neckY = y - bodyHeight - neckHeight - radius;
   
  // 首
  stroke(255);                                 // 線を白に
  line(x+2, y-bodyHeight, x+2, neckY);         // 線左
  line(x+12, y-bodyHeight, x+12, neckY);       // 線中央
  line(x+22, y-bodyHeight, x+22, neckY);       // 線右
  
  // アンテナ
  line(x+12, neckY, x-18, neckY-43);
  line(x+12, neckY, x+42, neckY-99);
  line(x+12, neckY, x+78, neckY+15);
  
  // 胴体
  noStroke();                                  // 線なし
  fill(255, 204, 0);                           // 塗りつぶしをオレンジに
  ellipse(x, y-33, 33, 33);                    // 円半重力
  fill(0);                                     // 塗りつぶしを黒に
  rect(x-45, y-bodyHeight, 90, bodyHeight-33); // 四角形胴体
  fill(255, 204, 0);                           // 塗りつぶしを黒に
  rect(x-45, y-bodyHeight+17, 90, 6);          // 四角形胴体
  
  // 頭
  noStroke();
  fill(0);                                 // 塗りつぶしを黒に
  ellipse(x+12, neckY, radius, radius);    // 円頭
  fill(255);                               // 塗りつぶしを白に
  ellipse(x+24, neckY-6, 14, 14);          // 円目
  fill(0);                                 // 塗りつぶしを黒に
  ellipse(x+24, neckY-6, 3, 3);            // 円瞳孔
  fill(153, 204, 255);                     // 塗りつぶしを明るい青に
  ellipse(x+0, neckY-8, 5, 5);             // 円小さな目左
  ellipse(x+30, neckY-26, 4, 4);           // 円小さな目中央
  ellipse(x+41, neckY+6, 3, 3);            // 円小さな目右
}