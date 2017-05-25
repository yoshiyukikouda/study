// PVector.limit()
class PVector {
  void limit(float max)
  {
    if(magSq() > max*max) {
      normalize();
      mult(max);
    }
  }  
}