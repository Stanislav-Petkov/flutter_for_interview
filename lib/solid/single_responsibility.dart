//https://www.youtube.com/watch?v=kF7rQmSRlq0&ab_channel=AlexHyett
//The Single Responsibility Principle (SRP) is one of the SOLID principles of object-oriented design, and it states that a class should have only one reason to change. In other words, a class should have only one responsibility or job.
//
// Here's a breakdown of the Single Responsibility Principle:
//
// One Reason to Change: A class should have only one primary responsibility or
// reason for change. If a class has multiple responsibilities, any change to
// one of those responsibilities may affect the other responsibilities, leading
// to code that is difficult to maintain and understand.
//
// Separation of Concerns: SRP encourages you to separate different concerns or
// responsibilities into separate classes or modules. Each class/module should
// focus on a specific aspect of the application's functionality.
//
// Easier Maintenance: By adhering to SRP, your code becomes more maintainable
// and easier to extend. Changes related to one responsibility should not
// impact unrelated parts of the codebase.

// Violation of SRP: This class has multiple responsibilities.

class Employee {
  String name;
  double salary;

  Employee(this.name, this.salary);

  void calculateSalary() {
    // Complex salary calculation logic here.
  }

  void saveToDatabase() {
    // Database save logic here.
  }
}

//In the above code, the Employee class has two responsibilities: calculating
// an employee's salary and saving the employee's data to a database. This
// violates SRP because changes to the database handling may affect the salary
// calculation, and vice versa.
//
// To adhere to SRP, you can refactor the code as follows:

// Adhering to SRP: Separate responsibilities into different classes.

class EmployeeSRP {
  String name;
  double salary;

  EmployeeSRP(this.name, this.salary);
}

class SalaryCalculator {
  static double calculateSalary(EmployeeSRP employee) {
    // Complex salary calculation logic here.
    return employee.salary;
  }
}

class DatabaseManager {
  static void saveEmployee(EmployeeSRP employee) {
    // Database save logic here.
  }
}

//In the refactored code:
//
// The Employee class is responsible only for representing an employee's data.
// The SalaryCalculator class is responsible for calculating an employee's salary.
// The DatabaseManager class is responsible for saving employee data to a database.
// By adhering to SRP, each class has a single responsibility, making the code
// more maintainable and flexible. Changes to one aspect of the system are
// less likely to impact unrelated parts of the codebase.
