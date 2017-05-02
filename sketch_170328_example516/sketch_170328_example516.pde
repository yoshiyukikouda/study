/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(204);
  line(20, 20, 220, 100); 
  if (keyPressed && (key == 'A' || key == 'a')) {
    line(220, 20, 20, 100);
  }
}