/**************************************************
関数説明　------------------------------------------
１．Window
・size(x, y)　…　Windowの描写

２．図形
・point(x, y)　…　点（位置指定）
・line(x1, y1, x2, y2)　…　線（始終点指定)
・rect(x, y, width, height)　…　長方形（x,y,幅,高さ）
・triangle(x1, y1, x2, y2, x3, y3)　…　三角形（3点指定）
・quad(x1, y1, x2, y2, x3, y3, x4, y4)　…　四角形（4点指定）
・ellipse(x, y, width, height)　…　円（x,y,幅,高さ)
・arc(x, y, width, height, 始点角度, 終点角度)　…　円（x,y,幅,高さ,始点角度,終点角度）

３．線・角の種類
・strokeWeight(size)　…　線の太さ
・strokeCap(type)　…　端の種類を指定
　　　SQUARE　…　直角の端
　　　PROJECT　…　突き出た端
　　　ROUND　…　丸い端
・strokeJoin(type)　…　角の種類を指定
　　　ROUND　…　丸い角
　　　BEVEL　…　斜めの角
　　　MITER　…　直角

４．描写モード
・描写関数 + Mode(type)　…　描写モードの指定
　以下は円の場合の例
　　　ellipseMode(CORNER)　…　描写の基準点を角にする
　※モードは種類が多いのでリファレンス参照とのこと。

５．色
・background(r,g,b)　…　背景色
・fill(r,g,b,transparency)　…　図形内の色
・stroke(r,g,b,transparency)　…　線の色
・noFill()　…　図形の塗りつぶしをしない
・noStroke()　…　線を描写しない

６．図形の生成
・beginShape()　…　図形描写の開始合図
・endShape(type)　…　図形描写の終了合図
　　　指定なし　…　図形を閉じない
　　　CLOSE　…　図形を閉じる
・vertex(x,y)　…　図形描写するための各点を指定
**************************************************/

/* 初期処理 */
float x = 60;
float y = 440;
int radius = 45;
int neckHeight = 70;
int bodyHeight = 160;

float easing = 0.04;

void setup() {
  size(640, 640);             // Window を描写
  ellipseMode(RADIUS);        // 描写モードを？
}

void draw() {
  strokeWeight(2);

  // 横方向の位置を決定
  int targetX = mouseX;
  x += (targetX - x) * easing;

  // ロボットのサイズを決定
  if (mousePressed) {
    neckHeight = 16;
    bodyHeight = 90;
  } else {
    neckHeight = 70;
    bodyHeight = 160;
  } 
  float neckY = y - bodyHeight - neckHeight - radius;
  
  // 背景色
  background(0, 153, 204);
  
  // 首
  stroke(255);                             // 線を白に
  line(x+2, y-bodyHeight, x+2, neckY);     // 線左
  line(x+12, y-bodyHeight, x+12,neckY);    // 線中央
  line(x+22, y-bodyHeight, x+22, neckY);   // 線右
  
  // アンテナ
  line(x+12, neckY, x-18, neckY-43);       // 線左
  line(x+12, neckY, x+42, neckY-99);       // 線中央
  line(x+12, neckY, x+78, neckY+15);       // 線右
  
  // 胴体
  noStroke();                              // 線なし
  fill(255, 204, 0);                       // 塗りつぶしをオレンジに
  ellipse(x, y-33, 33, 33);                // 円半重力
  fill(0);                                 // 塗りつぶしを黒に
  rect(x-45, y-bodyHeight, 90, bodyHeight-33);   // 四角形胴体
  
  // 頭
  fill(0);                                 // 塗りつぶしを黒に
  ellipse(x+12, neckY, radius, radius);    // 円頭
  fill(255);                               // 塗りつぶしを白に
  ellipse(x+24, neckY-6, 14, 14);          // 円目
  fill(0);                                 // 塗りつぶしを黒に
  ellipse(x+24, neckY-6, 3, 3);            // 円瞳孔
  fill(153, 204, 255);                     // 塗りつぶしを明るい青に
  ellipse(x, neckY-8, 5, 5);               // 円小さな目左
  ellipse(x+30, neckY-26, 4, 4);           // 円小さな目中央
  ellipse(x+41, neckY+6, 3, 3);            // 円小さな目右
}