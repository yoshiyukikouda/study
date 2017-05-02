int[] homeRuns;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(480, 120);
  Table table = loadTable("ortiz.csv");
  int rowCount = table.getRowCount();
  homeRuns = new int[rowCount];
  for (int i = 0; i < homeRuns.length; i++) {
    homeRuns[i] = table.getInt(i, 1);
  }
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  background(204);
  
  text("本塁打数", 10, 60);
  text("年", 270, 120);
  
  // グラフのメモリ
  stroke(255);
  line(70, 100, 70, 20);
  line(70, 100, 460, 100);
  for (int i = 0; i < homeRuns.length; i++) {
    float x = map(i, 0, homeRuns.length-1, 70, 460);
    line(x, 20, x, 100);
  }
  
  // 本塁打データに基づいて、折れ線グラフの描写
  noFill();
  stroke(204, 51, 0);
  beginShape();
  for (int i = 0; i < homeRuns.length; i++) {
    float x = map(i, 0, homeRuns.length-1, 70, 460);
    float y = map(homeRuns[i], 0, 60, 100, 20);
    vertex(x, y);
  }
  endShape();
}