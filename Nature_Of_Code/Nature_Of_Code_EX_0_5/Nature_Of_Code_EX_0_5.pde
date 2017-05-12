// ガウス分布 + ランダムウォーカー
import java.util.Random;

Walker walker;
Random generator;

void setup() {
  size(640, 480);
  walker = new Walker();
  generator = new Random();
  background(255);
}

void draw() {
  walker.step();
  walker.display();
}

class Walker {
  float x;
  float y;
  
  Walker() {
    x = width / 2;
    y = height / 2;
  }
  
  void step() {
    // 平均0.0、標準偏差1.0のガウス（「正規」）分布のdouble型の疑似乱数を生成
    float choice = random(1);

    float gauss = (float)generator.nextGaussian();
    float sd = 1;          // 標準偏差
    float mean = 2;        // 平均   
    float step = gauss * sd + mean;   
    println(step);
    if (choice <= 0.2) {
      x = x + step;
    } else if (choice <= 0.4) {
      x = x - step;
    } else if (choice <= 0.6) {
      y = y + step;
    } else if (choice <= 0.8){
      y = y - step;
    }   
  }

  void display() {
    stroke(0);
    point(x, y);
  }
}