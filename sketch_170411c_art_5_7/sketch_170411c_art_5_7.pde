import processing.opengl.*;

// 円オブジェクトのリスト
ArrayList circleList = new ArrayList();

// 回転
float sphereRotateX;
float sphereRotateY;

// 色
float sphereRed;
float sphereGreen;
float sphereBlue;

// 色変更の方向
int sphereRedDirection;
int sphereGreenDirection;
int sphereBlueDirection;

void setup() {
  // ウィンドウ初期化
  size(500, 500, OPENGL);
  // スムース
  smooth();
  // 色をランダム指定
  sphereRed = random(255);
  sphereGreen = random(255);
  sphereBlue = random(255);
  // 色変更方向を正方向に
  sphereRedDirection = 1;
  sphereGreenDirection = 1;
  sphereBlueDirection = 1;
  // 線の色を指定
  stroke(sphereRed, sphereGreen, sphereBlue, 150);
}  

void draw() {
  // 描写リセット
  background(0);
  
  // 球体を描写
  Sphere s = new Sphere();
  s.draw();
  
  //TODO 球体の中に円を描写
  for (int i = 0; i < circleList.size(); i++) {
    // 円の数だけ描写
    Circle c = (Circle)circleList.get(i);
    c.draw();
  }
  //saveFrame("frames/######.tif");
}


/*
* マウスクリック時の処理
*/
void mousePressed() {
  if (mouseButton == RIGHT) {
    circleList.add(new Circle());
  }
}

/*
* 球体生成クラス
*/
class Sphere {
  // 座標
  float x;
  float y;
  float z;
  
  // 球体の半径
  float radius = 200;
  float radiusNoise = random(10);
  
  void draw() {
    // 描写開始位置を画面中央に
    translate(width/2, height/2, 0);
    
    // 描写開始座標リセット
    float xlast = 0;
    float ylast = 0;
    float zlast = 0;
  
    // 角度リセット
    float angleS = 0;
    float angleT = 0;
    
    // ランダムで開始した色から少しずつ色変更
    if (sphereRed > 255 || sphereRed < 0) {
      sphereRedDirection *= -1;
    }
    sphereRed += (1 * sphereRedDirection);
    if (sphereGreen > 255 || sphereGreen < 0) {
      sphereGreenDirection *= -1;
    }
    sphereGreen += (1 * sphereGreenDirection);
    if (sphereBlue > 255 || sphereBlue < 0) {
      sphereBlueDirection *= -1;
    }   
    sphereBlue += (1 * sphereBlueDirection);
    stroke(sphereRed, sphereGreen, sphereBlue);

    // X, Y軸方向にフレーム数 * 0.01の速度で回転
    if (!mousePressed) {
      rotateX(frameCount * 0.005);
      rotateY(frameCount * 0.01);
    }

    // マウスクリックした位置で球体を回転（回転位置を記憶）
    if (mousePressed == true) {
      sphereRotateX = mouseY * 0.01;
      sphereRotateY = mouseX * 0.01;
    }
    rotateX(sphereRotateX);
    rotateY(sphereRotateY);
    
    // 球体の周りにらせんを描写
    while(angleT < 180) {      
      // 角度S、角度Tを指定数だけ傾ける
      angleS += 18;
      angleT += 0.25;
  
      // 角度値を取得
      float radiansS = radians(angleS);
      float radiansT = radians(angleT); 
  
      // x, y, z座標を取得
      x = 0 + (radius * cos(radiansS) * sin(radiansT));
      y = 0 + (radius * sin(radiansS) * sin(radiansT));
      z = 0 + (radius * cos(radiansT));
      
      // 球体をらせんで描写
      if (xlast != 0) {
        strokeWeight(5);
        point(x, y, z);
        strokeWeight(1.5);
        line(x, y, z, xlast, ylast, zlast);
      }
      // 現在値を保持
      xlast = x;
      ylast = y;
      zlast = z;
    }
  }
}

// TODO 球体の中で円をバウンドできるようにしたい
/*
* 重力によりバウンドする円の生成クラス
*/
class Circle {
  /* 円描写情報 */
  float radius = 10;                     // 円半径
  float x = width/2;                     // 円描写のx初期座標
  float y = height/2;                    // 円描写のx初期座標
  float xspeed = random(-10, 10);        // x座標の移動スピード
  float yspeed = random(-10, 10);        // y座標の移動スピード

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
    xspeed *= friction;  // 摩擦力
    yspeed *= friction;
    yspeed += gravity;   // 重力
    
    x += xspeed;
    y += yspeed;
    
    // x方向のMAX値まで到達したらマイナス方向への移動に変更
    if (x > width-radius || x < width-radius) {
      xspeed *= -1;
    }
    // y方向のMAX値まで到達したらマイナス方向への移動に変更
    if (y > height-radius || y < height-radius) {
      yspeed *= -1;
    }
    // 円の描写
    ellipse(x, y, radius, radius);
  }
}