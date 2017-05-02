ArrayList circleList = new ArrayList();
//PImage offscr;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  // ウィンドウ初期化
  background(0);
  size(640, 480);
  // 図形描写の初期化
  ellipseMode(RADIUS);
  noStroke();
  smooth();
  //TODO まだ理解できてない
  //// オフスクリーンバッファ
  //offscr = createImage(width, height, RGB);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  // 透明度20の黒四角を重ねて描写し、残像表現を表示
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);

  //TODO まだ理解できてない
  //// オフスクリーンバッファの更新
  //loadPixels();
  //offscr.pixels = pixels;
  //offscr.updatePixels();

  //// 描写数に満たない場合、円を追加
  //if (circleList.size() < 20) {
  //  circleList.add(new Circle());
  //}
  for (int i = 0; i < circleList.size(); i++) {
    // 円の数だけ描写
    Circle c = (Circle)circleList.get(i);
    c.draw();

    //// 円の描写位置がウィンドウ高さのサイズより大きくなったら消す
    //if (c.y-c.radius > height) {
    //  circleList.remove(i);
    //}
  }
  
  //TODO まだ理解できてない
  //// オフスクリーンバッファの描写
  //tint(255, 240);
  //image(offscr, 0, 0, width+6, height+6);
  
  //saveFrame("frames/######.tif");
}

/*
* マウスクリック時の処理
*/
void mousePressed() {
  circleList.add(new Circle());
  circleList.add(new Circle());
  circleList.add(new Circle());
  circleList.add(new Circle());
  circleList.add(new Circle());
}

void keyPressed() {
  circleList.add(new Circle());
}

/*
* 円生成クラス
*/
class Circle {
  /* 円描写情報 */
  float radius = random(5, 10);    // 円半径
  float x = mouseX;      // 円描写のx初期座標
  float y = 320;                   // 円描写のx初期座標
  float xspeed = random(-10, 10);  // x座標の移動スピード
  float yspeed = random(-10, 10);  // y座標の移動スピード

  /* カラー情報 */
  float r = random(255);
  float g = random(255);
  float b = random(255);

  /* 重力 */
  float gravity = 9.8/60;
  float friction = 0.999;

  void draw() {
    // 円描写の初期化
    fill(r, g, b);
    //xspeed *= friction;  // 摩擦力
    //yspeed *= friction;
    //yspeed += gravity;   // 重力
    
    x += xspeed;
    y += yspeed;
    
    // x方向のMAX値まで到達したらマイナス方向への移動に変更
    if (x > width-radius || x < radius) {
      xspeed *= -1;
    }
    // y方向のMAX値まで到達したらマイナス方向への移動に変更
    if (y > height-radius || y < radius) {
      yspeed *= -1;
    }
    // 円の描写
    ellipse(x, y, radius, radius);
  }
}