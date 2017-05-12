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

**************************************************/
// Window を描写
size(640, 640);

// 角を直角に
strokeCap(SQUARE);
// 線の太さを8ptに
strokeWeight(8);
// 線を描写
line(9, 359, 239, 409);

// 角を突き出た直角に
strokeCap(PROJECT);
// 線の太さを1ptに
strokeWeight(1);
// x,y,幅,高さを指定して四角形を描写
rect(409, 49, 60, 60);

// 線の太さを4ptに
strokeWeight(4);

// 3点を指定して三角形を描写
triangle(9, 59, 9, 109, 119, 109);

// 2点を指定して、円を描写
ellipse(239, 59, 59, 59);

// 線の太さを12ptに
strokeWeight(12);

// 4点を指定して四角形を描写
quad(119, 59, 89, 109, 169, 109, 199, 59);

// 2点と角度を指定して円を描写
arc(49, 239, 80, 80, radians(90), radians(360));

// 線の太さを1ptに
strokeWeight(1);


//-------------------------------------------------
// 背景色を黒
background(204, 226, 225);

// 線を消す
noStroke();

// 赤
fill(255, 0, 0, 160);

// 円1
ellipse(232, 282, 200, 200);

// 緑
fill(0, 255, 0, 160);

// 円2
ellipse(328, 196, 200, 200);

// 青
fill(0, 0, 255, 160);

// 円3
ellipse(368, 318, 200, 200);