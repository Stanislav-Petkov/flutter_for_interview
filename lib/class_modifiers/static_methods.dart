//https://dart.dev/language/classes#static-methods
import 'dart:math';

class Point {
  double x, y;
  Point(this.x, this.y);

  double t(){
    x; // Instance members can be accessed from instance methods.
    return 1.0;
  }
  static double distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    // x;//ERROR Instance members can't be accessed from a static method. (Documentation)
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {
  var a = Point(2, 2);
  var b = Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  assert(2.8 < distance && distance < 2.9);
  print(distance);
}