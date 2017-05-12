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

    float numX = (float)generator.nextGaussian();
    float numY = (float)generator.nextGaussian();
    float sd_position = 60;  // 標準偏差
    float meanX = width/2;   // 平均
    float meanY = height/2;
    
    // X, Y座標を算出
    x = sd_position * numX + meanX;
    y = sd_position * numY + meanY;  
  }

  void display() {
    stroke(0);
    point(x, y);
  }
}