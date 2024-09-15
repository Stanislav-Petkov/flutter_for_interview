//https://dart.dev/language/classes#instance-variables
class Point {
  double? _x; // Declare instance variable x, initially null.
  double? y; // Declare y, initially null.
  double z = 0; // Declare z, initially 0.
}

double initialX = 1.5;

class PointA {
  // OK, can access declarations that do not depend on `this`:
  double? x = initialX;

  // ERROR, can't access `this` in non-`late` initializer:
  double? y ;//= this.x;
  // double? y = this.x; THIS IS THE EXAMPLE from documentation that does not work

  // OK, can access `this` in `late` initializer:
  late double? z = this.x;

  // OK, `this.x` and `this.y` are parameter declarations, not expressions:
  PointA(this.x, this.y);
}


void main() {
  var point = Point();
  point._x = 4; // Use the setter method for x. THRE IS NO difference whether x or _x
  assert(point._x == 4); // Use the getter method for x.
  assert(point.y == null); // Values default to null.


}