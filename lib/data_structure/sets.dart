void main() {
//copy a collection

  final list = [1, 2, 3];
  final copy = list;
  // it makes a new reference to the same collection and does not
  // copy the values
  // both variables point to the same location in memory
  copy[0] = 0;
  print(list);
  print(copy);
  final realCopy = [...list];
  realCopy[2] = 0;
  print(realCopy);
}

void modifyMap() {
  var restaurants = [
    {
      'name': 'Pizza',
      'cuisine': 'Italian',
      'rating': [5, 3.5, 4.5],
    },
    {
      'name': 'Chez Anne',
      'cuisine': 'French',
      'rating': [5, 3.5, 4.5],
    },
    {
      'name': 'Navart',
      'cuisine': 'Indian',
      if (true) ...{
        'rating': [4, 4.5, 4.5],
        'isPopular': true,
      }
    },
  ];
  print(restaurants);

  var colors = [
    'grey',
    'brons',
    if (true) ...['yellow', 'green']
  ];
  print(colors);
}

void oper() {
  var a = {'a', 'b', 'c'};
  var b = {'a', 'd', 'e'};
  print(a.union(b));
  print(a.intersection(b));
  print(a.difference(b));
  print(b.difference(a));
}

void operations() {
  // It is not possible to put duplicate values in a set.
  // The order of the elements in a set is undefined.
  // The elements in a set are not indexed.
  // Sets are optimized for fast operations like adding, removing,
  // and testing for the existence of an item.
  // It is not possible to access items in a set by index.
  // Sets can be iterated in the same way as lists and maps.
  var set = {'a', 'b', 'c'};
  print(' set : $set');
  var a = {'d', 'e', 'f', ...set};
  print(a);

  Set b = {null, 'n', 'm'};
  print(b);
  var c = {'p', 'o', 'i', ...b};
  print(c);

  var t = {'a', 'b', if (true) 'c', for (var i = 0; i < 3; i++) 'd$i'};
  print(t);
  var g = t.add('a');

  /// returns false is the value is already in the set
  var g1 = t.add('h');
  print('$g    $g1');
}
