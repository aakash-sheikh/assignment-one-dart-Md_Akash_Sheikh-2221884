// Question 4: Inheritance & Polymorphism (Difficulty: 4/5) ⭐⭐⭐⭐
/// EXPECTED OUTPUT:
/// Vehicle Info: 2020 Toyota Camry (4 doors)
/// Starting the car engine...
/// Stopping the car engine...
/// 
/// Vehicle Info: 2021 Honda CBR (Has windshield: true)
/// Starting the motorcycle engine...
/// Stopping the motorcycle engine...
/// 
/// Car age: <Value> years
/// Motorcycle age: <Value> years

// 1. Abstract Class Vehicle:
//    - Properties: String brand, String model, int year
//    - Abstract method: void start()
//    - Abstract method: void stop()
//    - Concrete method: void displayInfo()
abstract class Vehicle {

  Vehicle(this.brand, this.model, this.year);
  String brand;
  String model;
  int year;

  // Abstract methods
  void start();
  void stop();

  // Concrete method
  void displayInfo() {
    print('Vehicle Info: $year $brand $model');
  }

  // Add a method to calculate vehicle age (current year - vehicle year)
  int calculateAge() {
    // Calculate and return vehicle age dynamically
    int currentYear = DateTime.now().year;
    return currentYear - year;
  }
}

// 2. Concrete Classes:
//    - Car extends Vehicle
//      - Additional property: int numberOfDoors
//      - Override start() and stop() methods
class Car extends Vehicle {

  Car(String brand, String model, int year, this.numberOfDoors)
      : super(brand, model, year);
  int numberOfDoors;

  @override
  void start() {
    print('Starting the car engine...');
  }

  @override
  void stop() {
    print('Stopping the car engine...');
  }

  @override
  void displayInfo() {
    // Override to show car-specific info as shown in expected output
    print('Vehicle Info: $year $brand $model ($numberOfDoors doors)');
  }
}

//    - Motorcycle extends Vehicle
//      - Additional property: bool hasWindshield
//      - Override start() and stop() methods
class Motorcycle extends Vehicle {

  Motorcycle(String brand, String model, int year, this.hasWindshield)
      : super(brand, model, year);
  bool hasWindshield;

  @override
  void start() {
    print('Starting the motorcycle engine...');
  }

  @override
  void stop() {
    print('Stopping the motorcycle engine...');
  }

  @override
  void displayInfo() {
    // Override to show motorcycle-specific info as shown in expected output
    print('Vehicle Info: $year $brand $model (Has windshield: $hasWindshield)');
  }
}

void main() {
  // 3. Create a list of vehicles and demonstrate polymorphism by calling start(), stop(), and displayInfo() on each vehicle
  
  // Create a list containing one Car and one Motorcycle
  var myCar = Car('Toyota', 'Camry', 2020, 4);
  var myMotorcycle = Motorcycle('Honda', 'CBR', 2021, true);
  
  List<Vehicle> vehicles = [myCar, myMotorcycle];

  // Loop through the list and call displayInfo(), start(), and stop()
  for (var vehicle in vehicles) {
    vehicle.displayInfo();
    vehicle.start();
    vehicle.stop();
    print(''); // Adds an empty line for readability to match expected output
  }

  // Print the age of each vehicle using calculateAge()
  print('Car age: ${myCar.calculateAge()} years');
  print('Motorcycle age: ${myMotorcycle.calculateAge()} years');
}