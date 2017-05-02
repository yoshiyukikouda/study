JitterBag[] bags = new JitterBag[100];

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  for (int i = 0; i < bags.length; i++) {
    float x = random(width);
    float y = random(height);
    float r = random(10, 30);
    bags[i] = new JitterBag(x, y, r);
  }
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  for (int i = 0; i < bags.length; i++) {
    bags[i].move();
    bags[i].display();
  }
}