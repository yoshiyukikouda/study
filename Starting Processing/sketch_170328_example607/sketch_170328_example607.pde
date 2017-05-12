float angle = 0;
float angleDirection = 1;
float speed = 0.005;

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
  
  translate(20, 25);
  rotate(angle);
  strokeWeight(12);
  line(0, 0, 40, 0);
  
  translate(40, 0);
  rotate(angle * 2.0);
  strokeWeight(6);
  line(0, 0, 30, 0);
  
  translate(30, 0);
  rotate(angle * 2.5);
  strokeWeight(3);
  line(0, 0, 20, 0);
  
  angle += speed * angleDirection;
  if (angle > QUARTER_PI || angle < 0) {
    angleDirection = -angleDirection;
  }
}