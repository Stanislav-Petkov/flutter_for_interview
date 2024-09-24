//https://dart.dev/language/constructors#named-constructors
const double xOrigin = 1;
const double yOrigin = 2;

class Point {
  final double x;
  final double y;

  // Sets the x and y instance variables
  // before the constructor body runs.
  Point(this.x, this.y);

  // Named constructor
  Point.origin()
      : x = xOrigin,
        y = yOrigin;
}

//A subclass doesn't inherit a superclass's named constructor.
// To create a subclass with a named constructor defined in the superclass,
// implement that constructor in the subclass.
class H extends Point {
  H() : super( 4, 5);
  // If you want to use the named constructor origin() from the superclass, you need to implement it
 H.origin() : super.origin();
}

void main() {
  var p = Point.origin(); // Use the named constructor
  var h = H();
  var t = H.origin();
  print('(${p.x}, ${p.y})'); // (1, 2)
  print('(${h.x}, ${h.y})'); // (4, 5)
  print('(${t.x}, ${t.y})'); // (1, 2)
}