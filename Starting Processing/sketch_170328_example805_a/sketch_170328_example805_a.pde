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

    // 円の描写位置がウィンドウサイズの外側になったら消す
    if (c.y < 0 || c.y > height || c.x < 0|| c.x > width) {
      circleList.remove(i);
    }
  }
}

/*
* マウスクリック時の処理
*/
void mousePressed() {
  circleList.add(new Circle());
}

void keyPressed(){
  circleList.add(new Circle());
}

/*
* 円生成クラス
*/
class Circle {
  /* 円描写情報 */
  float radius = random(5, 10);    // 円半径
  float x = 320;                   // 円描写のx初期座標
  float y = 320;                   // 円描写のx初期座標
  //float xspeed = random(-10, 10);  // x座標の移動スピード
  //float yspeed = random(-10, 10);  // y座標の移動スピード

  /* カラー情報 */
  float r = random(255);
  float g = random(255);
  float b = random(255);

  void draw() {
    // 円描写の初期化
    fill(r, g, b);
    
    y += 1.5;
    
    // 円の描写
    //translate(width/2, height/2);
    ellipse(mouseX, y, radius, radius);
  }
}