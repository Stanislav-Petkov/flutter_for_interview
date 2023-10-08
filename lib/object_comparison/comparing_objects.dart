import 'dart:collection';

void main() {

  /// region Immutability-------------------------------------------------------------------

  //String Immutability:

  //Dart strings are immutable. Once a string is created, its value
  // cannot be changed. Any operation that appears to modify
  // a string actually creates a new string with the modified value.
  String original = 'Hello';
  String modified = original.toUpperCase(); // Creates a new string
  print('$original $modified');

  // Immutable list using 'const'
  final List<int> immutableList = const [1, 2, 3];
  // immutableList.add(4);//throws an error
// Immutable list using 'UnmodifiableListView'
  final List<int> mutableList = [1, 2, 3];
  final unmodifiableList = UnmodifiableListView(mutableList);
  // unmodifiableList.add(8);//throws an error
  print(unmodifiableList); //throws an error

///endregion -------------------------------------------------------------------

  var str1 = 'This is a string';
  str1 = 'This is a new string';
  print(str1);

  int i1 = 1;
  int i2 = 1;
  int i3 = 2;
  double d1 = 1.0;
  double d2 = 1.0;
  double d3 = 1.5;
  bool b1 = true;
  bool b2 = true;
  bool b3 = false;
  String s1 = 'text';
  String s2 = 'text';
  String s3 = 'another text';

  print('i1 == i2: ${i1 == i2}');
  print('i1 == i3: ${i1 == i3}');
  print('d1 == d2: ${d1 == d2}');
  print('d1 == d3: ${d1 == d3}');
  print('b1 == b2: ${b1 == b2}');
  print('b1 == b3: ${b1 == b3}');
  print('s1 == s2: ${s1 == s2}');
  print('s1 == s3: ${s1 == s3}');


  print('identical(i1, i2): ${identical(i1, i2)}');
  print('identical(i1, i3): ${identical(i1, i3)}');
  print('identical(d1, d2): ${identical(d1, d2)}');
  print('identical(d1, d3): ${identical(d1, d3)}');
  print('identical(b1, b2): ${identical(b1, b2)}');
  print('identical(b1, b3): ${identical(b1, b3)}');
  print('identical(s1, s2): ${identical(s1, s2)}');
  print('identical(s1, s3): ${identical(s1, s3)}');

  var o = new Object();
  var isIdentical = identical(o, new Object()); // false, different objects.
  isIdentical = identical(o, o); // true, same object.
  isIdentical = identical(const Object(), const Object()); // true, const canonicalizes.
  isIdentical = identical([1], [1]); // false, different new objects.
  isIdentical = identical(const [1], const [1]); // true.
  isIdentical = identical(const [1], const [2]); // false.
  isIdentical = identical(2, 1 + 1); // true, integers canonicalize.

  var pair = (1, "a"); // Create a record.
  isIdentical = identical(pair, pair); // true or false, can be either.
  print('identical(pair, pair) $isIdentical');
  var pair2 = (1, "a"); // Create another(?) record.
  isIdentical = identical(pair, pair2); // true or false, can be either.
  print('identical(pair, pair2) $isIdentical');
  isIdentical = identical(pair, (2, "a")); // false, not identical values.
  print('identical(pair, (2, "a") $isIdentical');

  isIdentical = identical(pair, (1, "a", more: true)); // false, wrong shape.
  print('identical(pair, (1, "a", more: true) $isIdentical');

  print('===============================================');

  final Item itemA1 =  Item(name: 'A', price: 100);
  final Item itemA2 =  Item(name: 'A', price: 100);
  final Item itemA3 = itemA1;
  final Item itemB = Item(name: 'B', price: 200);

  print('itemA1 == itemA2: ${itemA1 == itemA2}');
  print('itemA1 == itemA3: ${itemA1 == itemA3}');
  print('itemA1 == itemB: ${itemA1 == itemB}');

  print('identical(itemA1, itemA2): ${identical(itemA1, itemA2)}');
  print('identical(itemA1, itemA3): ${identical(itemA1, itemA3)}');
  print('identical(itemA1, itemB): ${identical(itemA1, itemB)}');


  print('CONST ===============================================');
  const Item itemA4 =  Item(name: 'A', price: 100);
  const Item itemA5 =  Item(name: 'A', price: 100);

  print('itemA4 == itemA5: ${itemA4 == itemA5}');
  print('identical(itemA4, itemA5): ${identical(itemA4, itemA5)}');

  print('Item 2 overriden methods ===============================================');

  const Item2 itemA12 =   Item2(name: 'A', price: 100);
  const Item2 itemA22 =   Item2(name: 'A', price: 100);

  print('itemA12 == itemA22: ${itemA12 == itemA22}');
  print('identical(itemA12, itemA22): ${identical(itemA12, itemA22)}');

}

class Item {
  final String name;
  final double price;

  const Item({
    required this.name,
    required this.price,
  });
}

class Item2 {
  final String name;
  final double price;

  const Item2({
    required this.name,
    required this.price,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return (other is Item
        && other.runtimeType == runtimeType
        && other.name == name
        && other.price == price
    );
  }

  @override
  int get hashCode => Object.hash(name, price);
}
