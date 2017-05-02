int _num = 10;
Circle[] _circleArray = {};

/*
* 初期処理
*/
void setup() {
  // 初回に円を生成して表示
  size(500, 500);
  background(0);
  smooth();
  strokeWeight(0.05);
  fill(150, 50);
  drawCircles();
  frameRate(30);
}

/*
* 描写
*/
void draw() {
  // 円の移動に合わせて描写
  fill(255, 255, 255, 50);
  rect(0, 0, width, height);
  strokeCap(SQUARE);
  for (int i = 0; i < _circleArray.length; i++) {
    Circle circle = _circleArray[i];
    circle.updateMe();
  }
  saveFrame("frames/######.tif");
}

/*
* マウスリリース時
*/
void mouseReleased() {
  // 円を追加描写
  drawCircles();
  println(_circleArray.length);
}

/*
* 新規に円を生成して表示する
*/
void drawCircles() {
  for (int i = 0; i < _num; i++) {
    Circle circle = new Circle();
    //circle.drawMe();
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
  float angle;

  /*
  * コンストラクタ
  */
  Circle() {
    angle = 0;
    x = random(width);
    y = random(height);
    radius = random(10, 110); 
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alpha = random(100);
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

    // 移動を変更　※円回転の波を追加
    //x += xmove;
    //y += ymove;
    float radians = radians(angle);
    angle++;
    x += xmove + (sin(radians) * 2);
    y += ymove + (cos(radians) * 2);
    // ここまで
    
       
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
    
    float strokeRed = random(255);
    float strokeGreen = random(255);
    float strokeBlue = random(255);
    
    // 描写対象の円と他の円が重なったかを判定して取得
    for (int i = 0; i < _circleArray.length; i++) {
      Circle otherCircle = _circleArray[i];
      if (otherCircle != this) {
        float dist = dist(x, y, otherCircle.x, otherCircle.y);
        float overlap = dist - radius - otherCircle.radius;
        if (overlap < 0) {
          // 重なっている２つの円の中点を取得し、その位置から重なっている位置までの円を描写する
          float midx, midy;
          midx = (x + otherCircle.x) / 2;
          midy = (y + otherCircle.y) / 2;
          stroke(strokeRed, strokeGreen, strokeBlue, 100);
          noFill();
          overlap *= -1;
          ellipse(midx, midy, overlap, overlap);
        }
      }
    }   
    //drawMe();
  }
}