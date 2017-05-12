float[] x = new float[3000];

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  noStroke();
  fill(255, 200);
  for (int i = 0; i < x.length; i++) {
    x[i] = random(-1000, 200);
  }
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(0);
  for (int i = 0; i < x.length; i++) {
    x[i] += 0.5;
    float y = i * 0.4;
    arc(x[i], y, 12, 12, 0.52, 5.76);
  }
}