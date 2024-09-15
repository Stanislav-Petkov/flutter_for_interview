//https://dart.dev/language/constructors

class Person {
  String? firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson().
  Employee(this.a, super.data) : super.fromJson();

  int a;
  int? b;

  Employee.fromJson(super.data, this.a)
      : b = 5,
        super.fromJson() {
    print('in Employee $a');
  }
}

void main() {
  var employee = Employee.fromJson({'d': 'f'}, 4);
  print(employee.a);

  // Prints:
  // in Person
  // in Employee
  // Instance of 'Employee'

  var v = Vector3d(1, 2.0, 3);
  print('${v.x} + ${v.y} + ${v.z}');

  print('-------------------');
  Point p = Point.fromJson({'x': 1, 'y': 2});
  print('Point: (${p.x}, ${p.y})');

  print('------- const constructor ------------');

  const c = ImmutablePoint(0, 0);
  print(c.x);
  print(c.y);

  print('------- factory constructor ------------');

  var logger = Logger('UI');
  logger.log('Button clicked');

  var logMap = {'name': 'UI'};
  var loggerJson = Logger.fromJson(logMap);

  print('------- hashCode and equals ------------');
  var p1 = PersonA('Bob', 'Smith');
  var p2 = PersonA('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);
  print('${p1.hashCode} ${p2.hashCode} ${p3.hashCode}');
  print('${p1.hashCode == p2.hashCode} ${p1 == p2} ${p1 != p3}');
}

class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y) {
    print('in Vector2d');
  }
}

class Vector3d extends Vector2d {
  final double z;

  // Forward the x and y parameters to the default super constructor like:
  // Vector3d(final double x, final double y, this.z) : super(x, y);
  Vector3d(super.x, super.y, this.z);
}

class Point {
// Initializer list sets instance variables before
// the constructor body runs.

  //Initializer list
  Point.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
  }

  double x;
  double y;
}

// const constructor
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

class Animal {
  void chase(Animal x) {}
}

class Mouse extends Animal {}

class Cat extends Animal {
  @override
  void chase(covariant Mouse x) {}
}

// Override hashCode and ==
class PersonA {
  final String firstName, lastName;

  PersonA(this.firstName, this.lastName);

  // Override hashCode using the static hashing methods
  // provided by the `Object` class.
  @override
  int get hashCode => Object.hash(firstName, lastName);

  // You should generally implement operator `==` if you
  // override `hashCode`.
  @override
  bool operator ==(Object other) {
    return other is PersonA &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}
