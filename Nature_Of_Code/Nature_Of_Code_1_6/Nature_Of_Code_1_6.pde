// ベクトルの正規化

void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width / 2, height / 2);
  mouse.sub(center);

  // 計算した結果を正規化（大きさ１に変更）
  mouse.normalize();
  // 50倍
  mouse.mult(50);
  
  translate(width / 2, height / 2);
  line(0, 0, mouse.x, mouse.y);
}