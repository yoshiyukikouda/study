/*
* バグオブジェクトクラス
*/
class JitterBag {
  float x;
  float y;
  float diameter;
  float speed = 2.5;
  
  /*
  * コンストラクタ
  */
  JitterBag(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }

  /*
  * バグの移動定義
  */
  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }
  
  /*
  * バグの表示処理
  */
  void display() {
    ellipse(x, y, diameter, diameter);
  }
}