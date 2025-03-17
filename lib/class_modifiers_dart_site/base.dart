//https://dart.dev/language/class-modifiers#base
base class Vehicle {
  void moveForward(int meters) {
    // ...
  }
}


// Can be constructed.
Vehicle myVehicle = Vehicle();

// Can be extended.
base class Car extends Vehicle {
  int passengers = 4;
// ...
}

// If the class is in this file, it can be implemented, but if it is in another file, it cannot be implemented.
base class MockVehicle implements Vehicle {
  @override
  void moveForward(int meters) {
    // ...
  }
}