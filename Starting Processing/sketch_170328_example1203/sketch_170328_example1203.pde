Table table;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(240, 120);
  table = loadTable("cities.csv", "header");
  stroke(255);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  // 背景色
  background(0, 26, 51);

  // X座標位置をマウス位置
  float xoffset = map(mouseX, 0, width, -width*3, -width);
  translate(xoffset, -300);
  
  // スケールを10倍に
  scale(5);
  
  // 線を0.1pxに
  strokeWeight(0.1);

  for (int i = 0; i < table.getRowCount(); i++) {
    float latitube = table.getFloat(i, "lat");
    float longitube = table.getFloat(i, "lng");
    setXY(latitube, longitube);
  } 
}

void setXY(float lat, float lng) {
  float x = map(lng, -180, 180, 0, width);
  float y = map(lat, 90, -90, 0, height);
  point(x, y);
}