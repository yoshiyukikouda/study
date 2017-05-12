float speed = 20.5;
int diameter = 20;
float x;
float y; 

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  x = width/2;
  y = height/2;
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  float r = random(255);
  float g = random(255);
  float b = random(255);
  fill(r, g, b);
  x += random(-speed, speed);
  y += random(-speed, speed);
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);
  ellipse(x, y, diameter, diameter);
}