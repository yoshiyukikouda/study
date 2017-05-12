int x = 215;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  strokeWeight(12);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(204);
  
  stroke(102);
  line(mouseX, 0, mouseX, height);
  
  stroke(0);
  float mx = mouseX/2 + 60;
  
  line(mx, 0, mx, height);
}