PShape network;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  shapeMode(CENTER);
  network = loadShape("network.svg");
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(102);
  float diameter = map(mouseX, mouseY, width, 10, 800);
  shape(network, 320, 320, diameter, diameter);
}