float angle = 0.0;

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
  float sinval = sin(angle);
  println(sinval);
  
  float gray = map(sinval, -1, 1, 0, 255);
  background(gray);
  
  angle += 0.1;
}