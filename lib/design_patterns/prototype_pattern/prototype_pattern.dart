import 'package:flutter/material.dart';

@immutable
class Person {
  final String name;
  final String lastName;
  final int age;
  final String nation;

  const Person({
    required this.name,
    required this.lastName,
    required this.age,
    required this.nation,
  });

  Person copyWith({
    String? name,
    String? lastName,
    int? age,
    String? nation,
  }) {
    return Person(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      nation: nation ?? this.nation,
    );
  }

  /// Prototype pattern
  Person clone() {
    return Person(
      name: name,
      lastName: lastName,
      age: age,
      nation: nation,
    );
  }
}

void main() {
  Person person = const Person(
    name: 'SSS',
    lastName: 'ssf',
    age: 1,
    nation: 'nation',
  );

  Person person2 = person.clone();
  print(person2.name);
  print(person.hashCode);
  print(person2.hashCode);
  print(identical(person, person2));
}
