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
/** 
* 1度しか実行しない設定処理
**/
void setup() {
  /* 初期処理 */
  size(640, 640);             // Window を描写
  background(0);              // 背景色
  fill(255);                  // 図の塗りつぶしを白に
  //stroke(255);                // 線を白に
}

/** 
* 繰返し実行する描写処理
**/
void draw() {
  // 背景色を黒に
  background(0);
  
  // マウス位置に円描写
  noStroke();
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 9, 9);

  // マウス位置からランダムに線を描写
  strokeWeight(random(5));    // 線の太さを10pt以内でランダムに
  stroke(random(255), random(255), random(255));
  line(mouseX, mouseY, random(640), random(640));
  line(mouseX, mouseY, random(640), random(640));
  line(mouseX, mouseY, random(640), random(640));
  line(mouseX, mouseY, random(640), random(640));
  line(mouseX, mouseY, random(640), random(640));
}