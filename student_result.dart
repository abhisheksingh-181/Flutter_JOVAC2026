// Student Result Program
// Session-3 : Dart Programming Fundamentals

void main() {
  // Student Details
  String studentName = "John Doe";
  int rollNumber = 101;
  String course = "BCA";
  int semester = 3;

  // Subject Marks
  int subject1 = 85;
  int subject2 = 78;
  int subject3 = 91;

  // Calculations
  int totalMarks = subject1 + subject2 + subject3;
  double averageMarks = totalMarks / 3;
  double percentage = (totalMarks / 300) * 100;

  // Comparison Operator
  bool isPassed = percentage >= 40;

  // Assignment Operator
  subject1 += 5;

  // Recalculate after bonus marks
  totalMarks = subject1 + subject2 + subject3;
  averageMarks = totalMarks / 3;
  percentage = (totalMarks / 300) * 100;

  // Output
  print("========================================");
  print("        STUDENT RESULT REPORT");
  print("========================================");

  print("Student Name : $studentName");
  print("Roll Number  : $rollNumber");
  print("Course       : $course");
  print("Semester     : $semester");

  print("----------------------------------------");

  print("Subject 1 : $subject1");
  print("Subject 2 : $subject2");
  print("Subject 3 : $subject3");

  print("----------------------------------------");

  print("Total Marks : $totalMarks");
  print("Average Marks : ${averageMarks.toStringAsFixed(2)}");
  print("Percentage : ${percentage.toStringAsFixed(2)}%");
  print("Passed : $isPassed");

  print("========================================");
}