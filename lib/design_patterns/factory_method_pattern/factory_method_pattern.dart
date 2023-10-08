enum EmployeeType { boss, hrManager, programmer }

abstract class Employee {
  void work();

  // Factory method pattern
  factory Employee(EmployeeType type) {
    switch (type) {
      case EmployeeType.boss:
        return Boss();
      case EmployeeType.hrManager:
        return HRManager();
      case EmployeeType.programmer:
        return Programmer();
      default:
        return Programmer();
    }
  }
}

class Programmer implements Employee {
  @override
  void work() {
    print('coding an app');
  }
}

class HRManager implements Employee {
  @override
  void work() {
    print('recruiting');
  }
}

class Boss implements Employee {
  @override
  void work() {
    print('leading the people');
  }
}

void main() {
  // First way of using the pattern
  Employee e = Employee(EmployeeType.boss);
  e.work();
  // Second way of using the pattern
  Employee f = FactoryMethod.getEmployee(EmployeeType.boss);
  f.work();
}

// Second way of using the pattern
// In this way there is no need to create an instance of the class
// when we want to use  the factory method
class FactoryMethod {
  // Factory method pattern
  static Employee getEmployee(EmployeeType type) {
    switch (type) {
      case EmployeeType.boss:
        return Boss();
      case EmployeeType.hrManager:
        return HRManager();
      case EmployeeType.programmer:
        return Programmer();
      default:
        return Programmer();
    }
  }
}
