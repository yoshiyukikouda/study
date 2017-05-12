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
float x = 0;
float y = 0;
float px = 0;
float py = 0;
float easing = 0.06;

/** 
* 1度しか実行しない設定処理
**/
void setup() {
  size(640, 640);             // Window を描写
  stroke(0, 102);
}

/** 
* 繰返し実行する描写処理
**/
void draw() { 
  // マウス位置まで移動するX点の値をイージングして算出
  float targetX = mouseX;
  x += (targetX - x) * easing;

  // マウス位置まで移動するY点の値をイージングして算出
  float targetY = mouseY;
  y += (targetY - y) * easing;

  // 線の太さを、
  float weight = dist(x, y, px, py);
  strokeWeight(weight);

  // 線を描写
  line(x, y, px, py);

  // 線の太さの情報として、描写した位置情報を覚えておく
  px = x;
  py = y;
}