float[] gray;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  gray = new float[width];
  for (int i = 0; i < gray.length; i++) {
    gray[i] = random(0, 255);
  }
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(0);
  for (int i = 0; i < gray.length; i++) {
    stroke(gray[i]);
    line(i, 0, i, height);
  }
}