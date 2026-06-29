// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐
/// EXPECTED OUTPUT:
/// Manager: John Smith (ID: M001, Department: IT, Team Size: 5)
/// Job Title: Manager
/// Base Salary: 8000.0
/// Calculated Salary: 9000.0
/// Payment processed: 9000.0
/// Report: Monthly report for John Smith in IT department
/// 
/// Developer: Alice Johnson (ID: D001, Department: IT, Language: Dart)
/// Job Title: Senior Developer
/// Base Salary: 6000.0
/// Calculated Salary: 6500.0
/// Payment processed: 6500.0

// 1. Mixin Payable:
//    - Method: double calculateSalary(double baseSalary, double bonus)
//    - Method: void processPayment(double amount)
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    // Calculate total salary (base + bonus)
    return baseSalary + bonus;
  }

  void processPayment(double amount) {
    // Process payment and print "Payment processed: <amount>"
    print('Payment processed: $amount');
  }
}

// 2. Mixin Reportable:
//    - Method: String generateReport(String employeeName, String department)
mixin Reportable {
  String generateReport(String employeeName, String department) {
    // Generate and return report string
    return 'Report: Monthly report for $employeeName in $department department';
  }
}

// 3. Abstract Class Employee:
//    - Properties: String name, String id, String department
//    - Abstract method: String getJobTitle()
//    - Abstract method: double getBaseSalary()
abstract class Employee {
  Employee(this.name, this.id, this.department);
  String name;
  String id;
  String department;

  String getJobTitle();
  double getBaseSalary();

  void displayInfo() {
    // Display employee information (overridden in child classes)
  }
}

// 4. Concrete Classes:
//    - Manager extends Employee with Payable and Reportable
//      - Additional property: int teamSize
//      - Override required methods
class Manager extends Employee with Payable, Reportable {
  int teamSize;

  Manager(super.name, super.id, super.department, this.teamSize);

  @override
  String getJobTitle() {
    return 'Manager';
  }

  @override
  double getBaseSalary() {
    // Based on the expected output of 8000.0
    return 8000.0;
  }

  @override
  void displayInfo() {
    // Override to show manager-specific info as shown in expected output
    print('Manager: $name (ID: $id, Department: $department, Team Size: $teamSize)');
  }
}

//    - Developer extends Employee with Payable
//      - Additional property: String programmingLanguage
//      - Override required methods
class Developer extends Employee with Payable {
  String programmingLanguage;

  Developer(super.name, super.id, super.department, this.programmingLanguage);

  @override
  String getJobTitle() {
    return 'Senior Developer';
  }

  @override
  double getBaseSalary() {
    // Based on the expected output of 6000.0
    return 6000.0;
  }

  @override
  void displayInfo() {
    // Override to show developer-specific info as shown in expected output
    print('Developer: $name (ID: $id, Department: $department, Language: $programmingLanguage)');
  }
}

void main() {
  // 5. Create employees and demonstrate

  // Create one Manager and one Developer with the details shown in expected output
  var manager = Manager('John Smith', 'M001', 'IT', 5);
  var developer = Developer('Alice Johnson', 'D001', 'IT', 'Dart');

  // MANAGER LOGIC
  manager.displayInfo();
  print('Job Title: ${manager.getJobTitle()}');
  print('Base Salary: ${manager.getBaseSalary()}');
  
  // Calculate salary (Base is 8000, so bonus is 1000 to match expected 9000)
  var managerCalculatedSalary = manager.calculateSalary(manager.getBaseSalary(), 1000.0);
  print('Calculated Salary: $managerCalculatedSalary');
  
  // Process payment
  manager.processPayment(managerCalculatedSalary);
  
  // Generate and print report
  print(manager.generateReport(manager.name, manager.department));

  print(''); // Empty line to match expected output format

  // DEVELOPER LOGIC
  developer.displayInfo();
  print('Job Title: ${developer.getJobTitle()}');
  print('Base Salary: ${developer.getBaseSalary()}');
  
  // Calculate salary (Base is 6000, so bonus is 500 to match expected 6500)
  var developerCalculatedSalary = developer.calculateSalary(developer.getBaseSalary(), 500.0);
  print('Calculated Salary: $developerCalculatedSalary');
  
  // Process payment
  developer.processPayment(developerCalculatedSalary);
}