// パーリンノイズ + マッピング
Walker walker;

void setup() {
  size(640, 480);
  walker = new Walker();
  background(255);
}

void draw() {
  walker.step();
  walker.display();
}

class Walker {
  float timex;
  float timey;
  float x;
  float y;
  
  Walker() {
    timex = 0;      // ノイズの取得開始時間を0～に
    timey = 10000;  // ノイズの取得開始時間を10000～に　※ノイズは常に同じ値が出力されるため、時間をずらして移動をランダムにする
  }
  
  void step() {
    x = map(noise(timex), 0, 1, 0, width);
    y = map(noise(timey), 0, 1, 0, height);
    timex += 0.01;
    timey += 0.01;
    
    println("x = " + x + "    " + "y = " + y);
  }

  void display() {
    stroke(0);
    ellipse(x, y, 16, 16);
  }
}