class Area {
  final double length;
  final double breadth;
  final double area;

  const Area._internal(this.length, this.breadth) : area = length * breadth;

  factory Area(double l, double b) {
    if (l < 0 || b < 0) {
      throw Exception('Lenght and b must be not zero');
    }
    return Area._internal(l, b);
  }

  void display() {
    print('Area is $area');
  }
}

class Person {
  final String firstName;
  final String lastName;

  Person(this.firstName, this.lastName);

  factory Person.fromMap(Map<String, Object> map) {
    final firstName = map['firstName'] as String;
    final lastName = map['lastName'] as String;
    return Person(firstName, lastName);
  }
}

void main() {
  final p = Person('Sta', 'Pet');
  print('${p.firstName} ${p.lastName}');

  final myMap = {'firstName': 'Harry', 'lastName': 'Potter'};
  final p2 = Person.fromMap(myMap);
  print('${p2.firstName} ${p2.lastName}');

  // Area a = Area(10, 20);
  // a.display();
}
