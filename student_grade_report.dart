void main() {
  // Step 1: List of Students
  List<String> students = [
    "Rahul",
    "Priya",
    "Aman",
    "Sneha",
    "Karan"
  ];

  // Step 2: Map of Student Marks
  Map<String, int> marks = {
    "Rahul": 85,
    "Priya": 72,
    "Aman": 91,
    "Sneha": 65,
    "Karan": 38
  };

  // Step 3: Display Student Names using Different Loops

  print("Students using for loop:");
  for (int i = 0; i < students.length; i++) {
    print(students[i]);
  }

  print("\nStudents using while loop:");
  int i = 0;
  while (i < students.length) {
    print(students[i]);
    i++;
  }

  print("\nStudents using do-while loop:");
  int j = 0;
  do {
    print(students[j]);
    j++;
  } while (j < students.length);

  print("\nStudents using for-in loop:");
  for (String student in students) {
    print(student);
  }

  print("\nStudents using forEach:");
  students.forEach((student) {
    print(student);
  });

  // Step 4 & Step 5
  print("\n========================================");
  print("        STUDENT GRADE REPORT");
  print("========================================");

  for (String student in students) {
    int mark = marks[student]!;

    String grade;

    if (mark >= 90) {
      grade = "A+";
    } else if (mark >= 80) {
      grade = "A";
    } else if (mark >= 70) {
      grade = "B";
    } else if (mark >= 60) {
      grade = "C";
    } else if (mark >= 40) {
      grade = "D";
    } else {
      grade = "Fail";
    }

    String remarks;

    switch (grade) {
      case "A+":
        remarks = "Outstanding";
        break;
      case "A":
        remarks = "Excellent";
        break;
      case "B":
        remarks = "Very Good";
        break;
      case "C":
        remarks = "Good";
        break;
      case "D":
        remarks = "Needs Improvement";
        break;
      default:
        remarks = "Failed";
    }

    print("----------------------------------------");
    print("Student : $student");
    print("Marks : $mark");
    print("Grade : $grade");
    print("Remarks : $remarks");
  }

  print("========================================");
}