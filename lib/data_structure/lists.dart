void main() {

  final li = <int>[1, 2, 3, 4, 5,];
  li[1] = 444; // Can modify the value
  print(li);

  // Cannot modify a const list
  // const li = <int>[1, 2, 3, 4, 5,];
  // li[1] = 444; // throws a runtime error  Cannot modify an unmodifiable list
  // print(li);


}

void operationsOnList(){
  var li = <int>[1, 2, 3, 4, 5,]; // with type annotation another type
  // cannot be added like this :  <int>[1, 2, 3, 4, 5,'f'];
  print(li);

  print(li.indexOf(3)); //print index of the value

  print(li.indexOf(-3)); // print -1 not found

  print(li.contains(3));

  ///Inserts element at position index in this list.
  li.insert(1, 444);
  print(li);

  li.remove(444);
  print(li);

  print([1].first);
  // print([].first); // not correct, throws an error
  // print([].last);// not correct, throws an error

  // delete values
  li.clear();
  print(li);
}