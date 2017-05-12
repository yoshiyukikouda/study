// ベクトルを使用した場合のボール移動（3D）
import processing.opengl.*;
int sphereCount = 30;
Sphere sphere[] = new Sphere[sphereCount];
float rotX, rotY = 0;

void setup() {
  size(640, 640, OPENGL);
  noStroke();
  for (int i = 0; i < sphereCount; i++) {
    sphere[i] = new Sphere();
  }
}

void draw() {
  // 初期化
  background(0);  

  // 光源の設定
  ambientLight(20, 20, 20);                    // 環境光を当てる
  lightSpecular(255, 255, 255);                // 光の鏡面反射色（ハイライト）を設定
  directionalLight(100, 100, 100, 0, 1, -1);   // 指向性ライトを設定

  // 図形の描写
  for (int i = 0; i < sphereCount; i++) {
    sphere[i].drawSphere();
  } 
}

// 球体クラス
class Sphere {
  PVector location;
  PVector velocity;

  Sphere() {
    location = new PVector(width / 2, height / 2, random(-320, 320));      // 位置
    velocity = new PVector(random(-5, 5), random(-5, 5), random(-5, 5));   // 速度
  }
  
  void drawSphere() {
    if (mousePressed) {
      rotX = mouseY * 0.01;
      rotY = mouseX * 0.01;
    }
    rotateX(rotX);
    rotateY(rotY);

    // 現在位置に速度分の移動を加算
    location.add(velocity);
    
    // 画面端に到達したら方向転換
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height) || (location.y < 0)) {
      velocity.y = velocity.y * -1;
    }
    if ((location.z > 320) || (location.z < -320)) {
      velocity.z = velocity.z * -1;
    }
    
    // 図形描写
    pushMatrix();
    translate(location.x, location.y, location.z);
    specular(255);
    sphere(10);
    popMatrix();
  }
}