int numFrames = 12;
PImage[] images = new PImage[numFrames];
int currentFrame = 1;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  size(640, 640);
  for (int i = 0; i < images.length; i++) {
    String imageName = "frame-" + nf(i, 4) + ".png";
    images[i] = loadImage(imageName);
  }
  frameRate(24);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
  image(images[currentFrame], 0, 0);
  currentFrame++;
  if (currentFrame == images.length) {
    currentFrame = 0;
  }
}