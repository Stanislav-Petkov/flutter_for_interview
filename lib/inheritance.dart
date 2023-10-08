mixin class Test{}

class Animal{
  String name;
  Animal(this.name);
  void chase(covariant Animal animal){
    print("name is $name ,type is ${animal.runtimeType}");
  }
}

class Bird extends Animal{
  Bird(String name) : super(name);
  void chase(Animal animal){
    print("name is $name ,type is ${animal.runtimeType}");
  }
  void fly(){
    print("fly");
  }
}

class Cat extends Animal{
  Cat(String name) : super(name);


  @override
  void chase(  Bird animal){
    print("name is $name ,type is ${animal.runtimeType}");
  }
  void meow(){
    print("meow");
  }
}

// void main(){
//   Cat cat = Cat("cat");
//   Bird bird = Bird("bird");
//   cat.chase(bird);
// }
class Other{
  String? other;
}
class Person extends Other{
  // Properties
  String? name;
  int? age;

  // Method
  void display() {
    print("Name: $name");
    print("Age: $age");
  }
}
// Here In student class, we are extending the
// properties and methods of the Person class
class Student extends Person {
  // Fields
  String? schoolName;
  String? schoolAddress;

  // Method
  void displaySchoolInfo() {
    print("School Name: $schoolName");
    print("School Address: $schoolAddress");
    print("Student age: $age");
    print("Student other: $other");
  }
}

void main() {
  // Creating an object of the Student class
  var student = Student();
  student.name = "John";
  student.age = 20;
  student.schoolName = "ABC School";
  student.schoolAddress = "New York";
  student.display();
  student.displaySchoolInfo();
}

abstract class ParentClass {
  // Parent class code
  void t();
  void g(){}
}

class ChildClass implements ParentClass {
  @override
  void g() {
    // TODO: implement g
  }

  @override
  void t() {
    // TODO: implement t
  }


  // Child class code
}
