//https://www.darttutorial.org/dart-tutorial/dart-object-identity-equality/

class Point {
  int x;
  int y;
  Point({required this.x, required this.y});

  @override
  operator ==(o) => o is Point && o.x == x && o.y == y;

  @override
  int get hashCode => Object.hash(x, y);
}

void main() {
  var p1 = Point(x: 10, y: 20);
  var p2 = Point(x: 10, y: 20);
  var result = p1 == p2;
  print(result);
  print('p1: ${p1.hashCode}, p2: ${p2.hashCode}');
  final isIdentical = identical(p1, p2);
  // FALSE , because do NOT reference the same object
  print(isIdentical);

  var p3 = Point(x: 10, y: 20);
  var p4 = p3;
  var isP3IdenticalToP4 = identical(p3, p4);
  //TRUE
  print('isP3IdenticalToP4 $isP3IdenticalToP4');

}