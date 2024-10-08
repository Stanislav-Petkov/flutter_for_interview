//https://dart.dev/language/class-modifiers#interface
interface class Vehicle {
  void moveForward(int meters) {
    // ...
  }
}

// Can be extended in the same class, but not in another.
class Car extends Vehicle {
  int passengers = 4;
// ...
}
