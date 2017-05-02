int _num = 10;
Circle[] _circleArray = {};

/*
* 初期処理
*/
void setup() {
  // 初回に円を生成して表示
  size(500, 300);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}

/*
* 描写
*/
void draw() {
  // 円の移動に合わせて描写
  background(255);
  for (int i = 0; i < _circleArray.length; i++) {
    Circle circle = _circleArray[i];
    circle.updateMe();
  }
}

/*
* マウスリリース時
*/
void mouseReleased() {
  // 円を追加描写
  drawCircles();
}

/*
* 新規に円を生成して表示する
*/
void drawCircles() {
  for (int i = 0; i < _num; i++) {
    Circle circle = new Circle();
    circle.drawMe();
    _circleArray = (Circle[])append(_circleArray, circle);
  }
}

/*
* 円クラス
*/
class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alpha;
  float xmove, ymove;

  /*
  * コンストラクタ
  */
  Circle() {
    x = random(width);
    y = random(height);
    radius = random(10, 110);
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alpha = random(255);
    xmove = random(-5, 5);
    ymove = random(-5, 5);
  }
  
  /*
  * 円を描写する
  */
  void drawMe() {
    noStroke();
    fill(fillcol, alpha);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    noFill();
    ellipse(x, y, 10, 10);
  }
  
  /*
  * 円の移動と他の円
  */
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width + radius)) {
      x = 0 - radius;
    }
    if (x < (0 - radius)) {
      x = width + radius;
    }
    if (y > (height + radius)) {
      y = 0 - radius;
    }
    if (y < (0 - radius)) {
      y = height + radius;
    }
    
    // 描写対象の円と他の円が重なったかを判定して取得
    boolean touching = false;
    for (int i = 0; i < _circleArray.length; i++) {
      Circle otherCircle = _circleArray[i];
      if (otherCircle != this) {
        float dist = dist(x, y, otherCircle.x, otherCircle.y);
        float overlap = dist - radius - otherCircle.radius;
        if (overlap < 0) {
          touching = true;
          break;
        }
      }
    }

    // 重なっていたら徐々に透明に
    if (touching) {
      if (alpha > 0) {
        alpha--;
      }
    // 重なっていなかったら元に戻す 
    } else {
      if (alpha < 255) {
        alpha += 2;
      }
    }
    
    drawMe();
  }
}