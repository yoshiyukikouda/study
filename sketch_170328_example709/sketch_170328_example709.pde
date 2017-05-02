PShape network;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  network = loadShape("network.svg");
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(102);
  shape(network, 30, 10);
  shape(network, 180, 10, 280, 280);
}