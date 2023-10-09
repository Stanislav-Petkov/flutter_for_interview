/// Dart static keyword

class Car {
  // Car(this.name);
  Car(this.name1,{required this.example}){
    school = 'school';
  }

  Car.withoutName(this.example,this.name1);


  String example;
  String? school;
  static Car? _instance;
  String name1;
  static String nameStatic = 'bmw';
  static const int _counter = 0;
  static int get counter => _counter;

  static displayStatic() {
    _instance = Car('inside', example: 'example3');
    print('Car displayStatic is $nameStatic');
    print(' _counter is $_counter'); //cannot access
    // print('Car name1 is ${name1}'); //cannot access
    // displayNonStatic(); // Instance members can't be accessed from a static method. (Documentation)
  }

  displayNonStatic() {
    print('N Car displayStatic is $nameStatic');
    print('N Car displayStaticInstance is ${_instance?.name1}');
    print('N Car name1 is $name1');
    print(' _counter is $_counter');
  }
}
