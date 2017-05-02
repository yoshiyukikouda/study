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
  background(176, 204, 226);
  randomSeed(0);
  for (int y = 65; y < width + 130; y += 130) {
    for (int x = 35; x < width + 70; x += 70) {
      float r = random(0, 255);
      float g = random(0, 255);
      float b = random(0, 255);
      float scaler = random(0.25, 1.0);
      owl(x, y, r, g, b, scaler);
    }
  }
}

/*
* フクロウの描写
* @param x 描写開始 X座標
* @param y 描写開始 Y座標
*/
void owl(float x, float y, float r, float g, float b, float s) {
  // 処理前の状態を保持
  pushMatrix();

  // 座標の基準値を変更
  translate(x, y);
  
  // スケールサイズの指定
  scale(s);
  
  stroke(r, g, b);
  strokeWeight(70);
  line(0, -35, 0, -65);         // 胴体

  noStroke();
  fill(255);
  ellipse(-17.5, -65, 35, 35);  // 左白目
  ellipse(17.5, -65, 35, 35);   // 右白目
  arc(0, -65, 70, 70, 0, PI);   // あご
  
  fill(51, 51, 30);
  ellipse(-14, -65, 8, 8);      // 左目
  ellipse(14, -65, 8, 8);       // 右目
  quad(0, -58, 4, -51, 0, -44, -4, -51);  // くちばし
  
  // 状態を元に戻す
  popMatrix();
}