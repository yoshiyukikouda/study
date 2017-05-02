void setup() {
  size(500, 300);
  background(255);
  strokeWeight(0.5);
  smooth();
  
  int centx = 250;
  int centy = 150;
  
  float x, y;
  
  for (int i = 0; i < 100; i++) {
    float lastx = -999;
    float lasty = -999;
    float radiusNoise = random(10);
    float radius = 10;
    
    stroke(random(20), random(50), random(70), 80);
    
    int startangle = int(random(360));
    int endangle = int(random(1440, 2880));
    int anglestep = int(random(5, 8));
    
    for (float ang = startangle; ang <= endangle; ang += anglestep) {
      radiusNoise += 0.05;
      radius += 0.5;
      float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
      float rad = radians(ang);
      x = centx + (thisRadius * cos(rad));
      y = centy + (thisRadius * sin(rad));
      if (lastx > -999) {
        line(x, y, lastx, lasty);
      }
      lastx = x;
      lasty = y;
    }
  }
}

float customRandom() {
  float retValue = 1 - pow(random(1), 5);
  return retValue;
}