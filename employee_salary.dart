import 'dart:io';

class Employee {
  String employeeId = "";
  String employeeName = "";
  String department = "";

  void displayEmployeeInfo() {
    print("Employee ID : $employeeId");
    print("Name : $employeeName");
    print("Department : $department");
  }
}

class Salary extends Employee {
  double basicSalary = 0;
  double hra = 0;
  double da = 0;
  double bonus = 0;

  double calculateGrossSalary() {
    return basicSalary + hra + da + bonus;
  }

  double calculateTax() {
    double grossSalary = calculateGrossSalary();

    if (grossSalary > 80000) {
      return grossSalary * 0.20;
    } else if (grossSalary > 50000) {
      return grossSalary * 0.10;
    } else {
      return 0;
    }
  }

  double calculateNetSalary() {
    return calculateGrossSalary() - calculateTax();
  }

  void displaySalarySlip() {
    print("\n======================================");
    print("        EMPLOYEE SALARY SLIP");
    print("======================================");

    displayEmployeeInfo();

    print("\nBasic Salary : ₹$basicSalary");
    print("HRA : ₹$hra");
    print("DA : ₹$da");
    print("Bonus : ₹$bonus");

    print("\nGross Salary : ₹${calculateGrossSalary()}");
    print("Tax : ₹${calculateTax()}");
    print("Net Salary : ₹${calculateNetSalary()}");
  }
}

class PerformanceSalary extends Salary {
  double incentive = 0;

  @override
  double calculateGrossSalary() {
    return basicSalary + hra + da + bonus + incentive;
  }
}

void main() {
  PerformanceSalary emp = PerformanceSalary();

  print("Enter Employee ID:");
  emp.employeeId = stdin.readLineSync()!;

  print("Enter Employee Name:");
  emp.employeeName = stdin.readLineSync()!;

  print("Enter Department:");
  emp.department = stdin.readLineSync()!;

  print("Enter Basic Salary:");
  emp.basicSalary = double.parse(stdin.readLineSync()!);

  print("Enter HRA:");
  emp.hra = double.parse(stdin.readLineSync()!);

  print("Enter DA:");
  emp.da = double.parse(stdin.readLineSync()!);

  print("Enter Bonus:");
  emp.bonus = double.parse(stdin.readLineSync()!);

  print("Enter Performance Incentive:");
  emp.incentive = double.parse(stdin.readLineSync()!);

  emp.displaySalarySlip();
}