int robotCount = 3;
PShape[] bots = new PShape[robotCount];
float scalar = 0.3;

/**
* 初期処理
**/
void setup() {
  size(720, 480);
  background(0, 153, 204);
  for (int i = 0; i < bots.length; i++) {
    bots[i] = loadShape("robot" + (i+1) + ".svg");
  } 
  shapeMode(CENTER);
  Table robots = loadTable("botArmy.tsv", "header");
  for (TableRow row : robots.rows()) {
    int robotType = row.getInt("type");
    int x = row.getInt("x");
    int y = row.getInt("y");
    PShape bot = bots[robotType - 1];
    shape(bot, x, y, bot.width*scalar, bot.height*scalar);
  }
}