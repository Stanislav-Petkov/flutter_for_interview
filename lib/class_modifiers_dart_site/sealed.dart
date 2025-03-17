//https://dart.dev/language/class-modifiers#sealed
sealed class Vehicle {}

class Car extends Vehicle {}

class Truck implements Vehicle {}

class Bicycle extends Vehicle {}

// ERROR: Can't be instantiated.
// Vehicle myVehicle = Vehicle();

// Subclasses can be instantiated.
Vehicle myCar = Car();

String getVehicleSound(Vehicle vehicle) {
  // ERROR: The switch is missing the Bicycle subtype or a default case.
 //The type 'Vehicle' is not exhaustively matched by the switch
  // cases since it doesn't match 'Bicycle()'. (Documentation)  Try adding
  // a wildcard pattern or cases that match 'Bicycle()'.
  // return switch (vehicle) {
  //   Car() => 'vroom',
  //   Truck() => 'VROOOOMM',
  // };
  return '';
}