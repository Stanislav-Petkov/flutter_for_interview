//https://www.darttutorial.org/dart-tutorial/dart-generics/
class Pair<T> {
  T x;
  T y;
  Pair(this.x, this.y);
}

// void main() {
//   var pairInt = Pair<int>(10, 20);
//   print('x=${pairInt.x},y=${pairInt.y}');
//
//   var pairStr = Pair<String>('A', 'B');
//   print('x=${pairStr.x},y=${pairStr.y}');
// }

//// ==== EXAMPLE 2 ====
abstract class Shape {
  double get area;
}

class Circle extends Shape {
  double radius;

  Circle({required this.radius});

  @override
  double get area => 3.14 * radius * radius;
}

class Square extends Shape {
  double length;
  Square({required this.length});

  @override
  double get area => length * length;
}

// Does not extend Shape
class Triangle {
  double base;
  double height;

  Triangle({required this.base, required this.height});

  double get area => 0.5 * base * height;
}
class Region<T extends Shape> {
  List<T> shapes;
  Region({required this.shapes});

  double get area {
    double totalArea = 0;
    for (var shape in shapes) {
      totalArea += shape.area;
    }
    return totalArea;
  }
}

void main() {
  var circle = Circle(radius: 1);
  print(circle.area);
  var squareA = Square(length: 5);
  print(squareA.area);

  var triangle = Triangle(base: 10, height: 5);
  print(triangle.area);
  
  var region = Region(
      shapes: [circle, squareA, ]
  );

  // This is not possible because Triangle does not extend Shape
  // Error 'Object' doesn't conform to the bound
  // 'Shape' of the type parameter 'T'. (Documentation)
  // var region2 = Region(
  //     shapes: [circle, squareA, triangle]
  // );

  print(region.area);
}
