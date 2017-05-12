// パーリンノイズをMap関数でマッピング、ノイズ = 0～1までの範囲、マッピングの範囲 = 0～heightまでの範囲ｓ
float time = 0;
float x = 0;

void setup() {
  smooth();
  size(300, 360);
  background(255);
}

void draw() {
  float n = noise(time);
  print("noise : " + n + "     ");
  
  float y = map(n, 0, 1, 0, height); // ノイズ値、0～1までの範囲、0～heightまでの範囲でマッピング
  println("map_y : " + y);
  
  ellipse(x, y, 1, 1);
  x += 0.5;
  time += 0.01;
  
  if (x > width) {
    x = 0;
    background(255);
  }
}