JitterBag jit;
JitterBag bag;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  jit = new JitterBag(width * 0.33, height/2, 50);
  bag = new JitterBag(width * 0.66, height/2, 10);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  jit.move();
  jit.display();
  bag.move();
  bag.display();
}