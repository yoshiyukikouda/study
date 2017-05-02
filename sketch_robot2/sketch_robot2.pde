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
int x = 60;
int y = 420;
int bodyHeight = 110;
int neckHeight = 140;
int radius = 45;
int ny = y - bodyHeight - neckHeight - radius;

size(640, 640);             // Window を描写
background(0, 153, 204);    // 背景色
strokeWeight(2);            // 線を2ptに変更
ellipseMode(RADIUS);        // 描写モードを？

// 首
stroke(255);                          // 線を白に
line(x+2, y-bodyHeight, x+2, ny);     // 線左
line(x+12, y-bodyHeight, x+12, ny);   // 線中央
line(x+22, y-bodyHeight, x+22, ny);   // 線右

// アンテナ
line(x+12, ny, x-18, ny-43);   // 線左
line(x+12, ny, x+42, ny-99);   // 線中央
line(x+12, ny, x+78, ny+15);   // 線右

// 胴体
noStroke();                 // 線なし

fill(255, 204, 0);          // 塗りつぶしをオレンジに
ellipse(x, y-33, 33, 33);   // 円半重力
fill(0);                    // 塗りつぶしを黒に
rect(x-45, y-bodyHeight, 90, bodyHeight-33);   // 四角形胴体
fill(255, 204, 0);          // 塗りつぶしをオレンジに
rect(x-45, y-bodyHeight+17, 90, 6);            // 四角形アクセント

// 頭
fill(0);                      // 塗りつぶしを黒に
ellipse(x+12, ny, radius, radius);  // 円頭
fill(255);                    // 塗りつぶしを白に
ellipse(x+24, ny-6, 14, 14);  // 円目
fill(0);                      // 塗りつぶしを黒に
ellipse(x+24, ny-6, 3, 3);    // 円瞳孔
fill(153, 204, 255);          // 塗りつぶしを明るい青に
ellipse(x, ny-8, 5, 5);       // 円小さな目左
ellipse(x+30, ny-26, 4, 4);   // 円小さな目中央
ellipse(x+41, ny+6, 3, 3);    // 円小さな目右