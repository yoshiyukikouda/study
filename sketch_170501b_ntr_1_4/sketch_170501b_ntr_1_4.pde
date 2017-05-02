import java.util.Random;
Random generator;

void setup() {
  size(640, 360);
  generator = new Random();
}

void draw() {
  // 平均0.0、標準偏差1.0のガウス（「正規」）分布のdouble型の疑似乱数を生成
  float num = (float)generator.nextGaussian();
  float sd = 60;
  float mean = 320;
  
  float x = sd * num + mean;
  
  noStroke();
  fill(255, 10);
  ellipse(x, 180, 16, 16);
}