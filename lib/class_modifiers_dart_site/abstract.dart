//https://dart.dev/language/class-modifiers#final

abstract class Vehicle {
  void moveForward(int meters);
}

// Error: Can't be constructed.
//Abstract classes can't be instantiated. (Documentation)
// Vehicle myVehicle = Vehicle();

// Can be extended.
class Car extends Vehicle {
  int passengers = 4;

  // If the method is no implemented there is an error
  //Missing concrete implementation of 'Vehicle.moveForward'. (Documentation)
  @override
  void moveForward(int meters) {
    // ...
  }
}

// Can be implemented.
class MockVehicle implements Vehicle {
  //// If the method is no implemented there is an error
  // Missing concrete implementation of 'Vehicle.moveForward'. (Documentation)
  @override
  void moveForward(int meters) {
    // ...
  }
}