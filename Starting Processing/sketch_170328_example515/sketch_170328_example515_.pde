int x = 80;
int y = 30;
int w = 80;
int h = 60;

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
  if(mouseX > x && mouseX < x + w
      && mouseY > y && mouseY < y + h) {
    fill(0);
  } else {
    fill(255);
  }
  rect(x, y, w, h);
}