PrintWriter writer;

/**
* 初期処理
**/
void setup() {
  size(720, 480);
  writer = createWriter("botArmy.tsv");
  writer.println("type\tx\ty");
  
  for (int y = 0; y <= height; y += 120) {
    for (int x = 0; x <= width; x += 60) {
      int robotType = int(random(1, 4));
      writer.println(robotType + "\t" + x + "\t" + y);
      ellipse(x, y, 12, 12);
    }
  }
  writer.flush();
  writer.close();
}



Robot[] bots;

/**
* 初期処理
**/
void setup() {
  size(720, 480);             // Window を描写
  PShape robotShape = loadShape("robot2.svg");
  bots = new Robot[20];
  for (int i = 0; i < bots.length; i++) {
    float x = random(-40, width-40);
    float y = map(i, 0, bots.length, -100, height-200);
    bots[i] = new Robot(robotShape, x, y);
  }
}

/*
* 描写処理（繰返し実行）
*/
void draw() {
  // 背景
  background(0, 153, 204);
  for (Robot bot : bots) {
    bot.update();
    bot.display();
  }
}

/*
* ロボットオブジェクトクラス
*/
class Robot {
  float xpos;
  float ypos;
  float angle;
  PShape botShape;
  float yoffset = 0.0;
  
  /*
  * コンストラクタ
  */
  Robot(PShape shape, float tempX, float tempY) {
    botShape = shape;
    xpos = tempX;
    ypos = tempY;
    angle = random(0, TWO_PI);
  }
  
  /*
  * Y座標位置の更新処理（サイン波を利用して、上下に移動）
  */
  void update() {
    angle += 0.05;
    yoffset = sin(angle) * 20;
  }
  
  /*
  * ロボットの表示
  */
  void display() {
    shape(botShape, xpos, ypos + yoffset);
  }
}