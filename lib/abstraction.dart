import 'package:flutter_for_interview/factory_shape.dart';

abstract class UserRepositoryInterface{
  UserRepositoryInterface(){
    print("UserRepositoryInterface55555");
  }
  List<int> users = [];
  void create();
  void update();
  void delete(){
    print("delete");
  }
}
class UserRepository implements UserRepositoryInterface{
  @override
  void create() {
    // TODO: implement create
  }

  @override
  void update() {
    // TODO: implement update
  }

  void test(){
    print("test");
  }

  @override
  late List<int> users;

  @override
  void delete() {
    // TODO: implement delete
  }
}

class Animal{
  external void chase();
  external void chase1();
}
class D implements Animal{
  @override
  void chase() {
    // TODO: implement chase
  }

  @override
  void chase1() {
    // TODO: implement chase1
  }



}
// void main(){
//   // UserRepositoryInterface userRepositoryInterface = UserRepositoryInterface();
//   UserRepository userRepository = UserRepository();
//   userRepository.test();
//   userRepository.delete();
//   D d = D();
//   d.chase();
// }

abstract class Shape {
  int dim1, dim2;
  // Constructor
  Shape(this.dim1, this.dim2);
  // Abstract method
  void area();
}

class Rectangle extends Shape {
  // Constructor
  Rectangle(int dim1, int dim2) : super(dim1, dim2);

  // Implementation of area()
  @override
  void area() {
    print('The area of the rectangle is ${dim1 * dim2}');
  }
}

class Triangle extends Shape {
  // Constructor
  Triangle(int dim1, int dim2) : super(dim1, dim2);

  // Implementation of area()
  @override
  void area() {
    print('The area of the triangle is ${0.5 * dim1 * dim2}');
  }
}

void main() {
  // Shape s = Shape(10, 20); //error

  Rectangle rectangle = Rectangle(10, 20);
  rectangle.area();

  Triangle triangle = Triangle(10, 20);
  triangle.area();
}
