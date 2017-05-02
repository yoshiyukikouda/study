int num = 60;
int[] x = new int[num];
int[] y = new int[num];

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  noStroke();
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(0);
  for (int i = x.length-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  x[0] = mouseX;
  y[0] = mouseY;
  for (int i = 0; i < x.length; i++) {
    fill(i * 4);
    ellipse(x[i], y[i], 40, 40);
  }
}