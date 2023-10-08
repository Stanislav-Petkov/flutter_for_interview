enum ShapeType { circle, rectangle }

abstract class Shape {
  factory Shape(ShapeType st) {
    if (st == ShapeType.circle) {
      return Circle();
    } else if (st == ShapeType.rectangle) {
      return Rectangle();
    } else {
      throw Exception('Wrong type');
    }
  }

  void draw();
}

class Circle implements Shape {
  @override
  void draw() {
    print('Drawing circle');
  }
}

class Rectangle implements Shape {
  @override
  void draw() {
    print('Drawing rectangle');
  }
}

void main() {
  final s = Shape(ShapeType.circle);
  List<Shape> list = [];
  list.add(Circle());
  list.add(Rectangle());
  list..add(Shape(ShapeType.circle))..add(Shape(ShapeType.rectangle));
  for(Shape sh in list){
    sh.draw();
    print(sh.hashCode);
  }
  // s.draw();
}
