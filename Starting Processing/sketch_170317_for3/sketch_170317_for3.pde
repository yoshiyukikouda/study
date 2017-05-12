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

void setup() {
  /* 初期処理 */
  size(640, 640);             // Window を描写
  background(0);              // 背景色
  //fill(255);                  // 図の塗りつぶしを白に
  //stroke(102);                // 線なし
}

void draw() {
  for (int y = 20; y <= height -20; y += 10) {
    for (int x = 20; x <= width -20; x+= 10) {
      float r = random(255);
      float g = random(255);
      float b = random(255);
      
      // 線を描写
      //stroke(x - 20, y - 20, (x + y) * 0.3 - 20);
      stroke(r, g, b);
      line(x, y, 320, 320);
      // 円を描写
      fill(r, g, b);
      ellipse(x, y, 4, 4);
    }
  }
}