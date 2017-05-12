Table table;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  table = loadTable("ortiz.csv");
  for (int i = 0; i < table.getRowCount(); i++) {
    int year = table.getInt(i, 0);
    int homeRuns = table.getInt(i, 1);
    int rbi = table.getInt(i, 2);
    float avarage = table.getFloat(i, 3);
    println(year, homeRuns, rbi, avarage);
  }
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
}