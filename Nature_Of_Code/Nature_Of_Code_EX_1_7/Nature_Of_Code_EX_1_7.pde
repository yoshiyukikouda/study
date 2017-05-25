// static, 非staticなPVector
void setup() {
  // v = new PVector
  PVector v = new PVector(1, 5);
  println("v:" + v);

  // u = v * 2 (static)
  PVector u = PVector.mult(v, 2);
  println("u:" + u);

  // w = v - u (static)
  PVector w = PVector.sub(v, u);
  println("w:" + w);

  // w / 3 (非static)
  w.div(3);
  println("w/3:" + w);
}