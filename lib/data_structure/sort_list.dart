void main() {
  var list = [6, 1, 2, 3];

  /// Sort number from largest to smallest
  list.sort();
  print(list);
  print(list.reversed);

  var names = [
    'bb',
    'ccc',
    'dddd',
    'a',
  ];
  // Sort names from shortest to longest
  names.sort((a, b) => a.length.compareTo(b.length));
  print(names);

  // Sort humans by age and print their names
  var h = [
    Human(name: 'a', age: 3),
    Human(name: 'b', age: 5),
    Human(name: 'c', age: 1),
    Human(name: 'd', age: 2),
  ];
  h.sort((a, b) => a.age.compareTo(b.age));
  for (var element in h) {
    print({element.name});
  }
}

class Human {
  Human({required this.name, required this.age});
  final String name;
  final int age;
}
