import 'dart:collection';

import 'package:flutter/foundation.dart';

void main() {
  // HashMap<K, V>:

  // A HashMap is similar to a regular map (Map<K, V>), but it doesn't
  // guarantee any specific order of key-value pairs.
  // It's more memory-efficient than a LinkedHashMap because it
  // doesn't keep track of insertion order.
  // Use it when order doesn't matter, and you want to optimize memory usage.

  HashMap<String, String> toppings = HashMap();
  toppings.addAll({'A': 'a', 'B': 'b', 'Q': 'q', 'W': 'w'});

  //A LinkedHashMap preserves the insertion order of key-value pairs.
  // It's similar to a regular map but guarantees a specific order.
  // Use it when you need to maintain the order in which elements were added.
  Map<String, String> ages = LinkedHashMap();
  ages = LinkedHashMap.of({'A': 'a', 'B': 'b', 'Q': 'q', 'W': 'w'});

  //SplayTreeMap<K, V>:
  //
  // A SplayTreeMap is a self-balancing binary search tree. It
  // maintains key-value pairs in sorted order based on keys.
  // It has a logarithmic time complexity for most operations,
  // making it efficient for sorted maps.
  // Use it when you need to maintain key-value pairs in sorted order.
  // Example:
  SplayTreeMap<String, String> splay = SplayTreeMap();
  splay.addAll({'A': 'a', 'B': 'b', 'Q': 'q', 'W': 'w'});
}

void regularMap() {
  var toppings = {
    'A': 'a',
    'B': 'b',
    'Q': 'q',
    'W': 'w',
  };

  // iterate on key values
  toppings.forEach((key, value) {
    print('$key $value');
  });

  // copy a map
  var newMap = Map.from(toppings);
  print(newMap);
// keys are unique within the map
  var letters = {'A': 'a', 'B': 'b', 'Q': 'q', 'W': 'w'};
  letters['A'] = 'A'; //update a value, because the key exists
  letters['A1'] = 'A'; // add a value, because the key does not exist
  print(letters);

  var another = Map.of(toppings);
  print(another);
}

void someActionsOnMap() {
  var toppings = {'John': 'Pepperoni', 'Mary': 'Cheese'};
  print(toppings);
  print(toppings['John']);

  //show values
  print(toppings.values);

  // show keys
  print(toppings.keys);

  // add something
  toppings['Tip'] = 'Sausage';
  print(toppings);

  // add many things
  toppings.addAll({'Q': 'q', 'W': 'w'});
  print(toppings);

  //remove something
  toppings.remove('Q');
  print(toppings);

  // remove all
  // toppings.clear();
  print(toppings);

  // access not existing key
  print(toppings['Cheese']);

  // is existing pair contained by key
  print(toppings.containsKey('John'));
}
