/// Dart const constructor

class T {
  T(this.name);
  final String name;
  void dis() {
    print('TTT: $name');
  }
}

class Bike {
  const Bike(this.name1, this.school, {required this.example});

  Bike.withoutName(
    this.example,
    this.name1,
    this.school,
  );

  final String example;
  final String? school;
  // static final Bike? _instance;
  final String name1;
  static const String nameStatic = 'bmw';
  static const int _counter = 0;
  static int get counter => _counter;

  static displayStatic() {
    // _instance = Bike('inside', example: 'example3');
    print('Car displayStatic is $nameStatic');
    print(' _counter is $_counter'); //cannot access
    // print('Car name1 is ${name1}'); //cannot access
    // displayNonStatic(); // Instance members can't be accessed from a static method. (Documentation)
  }

  displayNonStatic() {
    print('N Car displayStatic is $nameStatic');
    // print('N Car displayStaticInstance is ${_instance?.name1}');
    print('N Car name1 is $name1');
    print(' _counter is $_counter');
  }
}

void main() {
  var t = T('FF');
  t.dis();
}
