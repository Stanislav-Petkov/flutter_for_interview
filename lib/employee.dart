/// encapsulation
class VehicleEncap{
  String? model;

}

class Employee {
  // Private property
  String? _name;

  // Getter method to access private property _name
  String? getName() {
    return _name;
  }

  // Setter method to update private property _name
  void setName(String name) {
    _name = name;
  }
}

class Student1 {
  final _schoolName = "ABC School";

  String getSchoolName() {
    return _schoolName;
  }
}

void main() {
  Employee employee = Employee();
  employee.setName('GG');
  print('employee name is ${employee.getName()}');
  print('employee name is ${ employee._name}');
  employee._name = 'GG1';
  print('employee name is ${ employee._name}');
}