//https://dart.dev/language/class-modifiers#interface
import 'interface.dart';

// Can be constructed.
Vehicle myVehicle = Vehicle();

// ERROR: Can't be inherited.
// The class 'Vehicle' can't be extended outside of its library
// because it's an interface class.
// class Car extends Vehicle {
//   int passengers = 4;
// ...
// }

// Can be implemented.
class MockVehicle implements Vehicle {
  @override
  void moveForward(int meters) {
    // ...
  }
}