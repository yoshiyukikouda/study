// カスタム分布
import java.util.Random;

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
  float x;
  float y;
  
  Walker() {
    x = width / 2;
    y = height / 2;
  }
  
  void step() {
    // 平均0.0、標準偏差1.0のガウス（「正規」）分布のdouble型の疑似乱数を生成
    float choice = random(0, 10);
    float stepx = random(-choice, choice);
    float stepy = random(-choice, choice);
    
    x += stepx;
    y += stepy;
  }

  void display() {
    stroke(0);
    point(x, y);
  }
}