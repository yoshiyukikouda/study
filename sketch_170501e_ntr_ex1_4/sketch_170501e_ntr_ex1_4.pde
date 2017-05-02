import java.util.Random;
Random generator;

void setup() {
  size(640, 360);
  generator = new Random();
}

void draw() {
  // 線なし
  noStroke();
  
  // 平均0.0、標準偏差1.0のガウス（「正規」）分布のdouble型の疑似乱数を生成
  float numR = (float)generator.nextGaussian();
  float numG = (float)generator.nextGaussian();
  float numB = (float)generator.nextGaussian();
  float sd_color = 127;    // 標準偏差
  float mean_color = 127;  // 平均

  // カラー情報を算出
  float r = sd_color * numR + mean_color;
  float g = sd_color * numG + mean_color;
  float b = sd_color * numB + mean_color;
  fill(r, g, b, 20);

  // 平均0.0、標準偏差1.0のガウス（「正規」）分布のdouble型の疑似乱数を生成
  float numX = (float)generator.nextGaussian();
  float numY = (float)generator.nextGaussian();
  float sd_position = 60;  // 標準偏差
  float meanX = width/2;   // 平均
  float meanY = height/2;

  // X, Y座標を算出
  float x = sd_position * numX + meanX;
  float y = sd_position * numY + meanY;

  // 円を描写
  ellipse(x, y, 16, 16);
}