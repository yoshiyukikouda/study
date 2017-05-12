import processing.sound.*;

AudioIn mic;
Amplitude amp;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  // ウィンドウ初期化
  background(0);
  size(440, 440);
  
  mic = new AudioIn(this, 0);
  mic.start();
  
  amp = new Amplitude(this);
  amp.input(mic);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  noStroke();
  fill(26, 76, 102, 10);
  rect(0, 0, width, height);
  float diameter = map(amp.analyze(), 0, 1, 10, width);
  fill(255);
  ellipse(width/2, height/2, diameter, diameter);
}