// パーリンノイズ + マッピング　※移動ステップにパーリンノイズ適用
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
  float x = width / 2;
  float y = height / 2;
  
  Walker() {
    timex = 0;      // ノイズの取得開始時間を0～に
    timey = 10000;  // ノイズの取得開始時間を10000～に　※ノイズは常に同じ値が出力されるため、時間をずらして移動をランダムにする
  }
  
  void step() {
    float stepx = map(noise(timex), 0, 1, -2, 2);
    float stepy = map(noise(timey), 0, 1, -2, 2);
    
    println("stepx = " + stepx + "    " + "stepy = " + stepy);
    
    x += stepx;
    y += stepy;
    timex += 0.01;
    timey += 0.01;

    //println("x = " + x + "    " + "y = " + y);
  }

  void display() {
    stroke(0);
    ellipse(x, y, 16, 16);
  }
}