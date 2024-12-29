
//A
abstract class Role {
  void displayRole(); // Abstract method to be implemented by subclasses
}

//B
class Person implements Role {
  final String name;
  final int age;
  final String address;

  // Reference to Role
  final Role role;

  // Constructor
  Person({
    required this.name,
    required this.age,
    required this.address,
    required this.role,
  });

  // Getter methods
  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  // Implementation of Role abstract method
  @override
  void displayRole() {
    role.displayRole();
  }
}



//C
class Student extends Person implements Role {
  final String studentID;
  final String grade;
  final List<double> courseScores;

  // Constructor
  Student({
    required String name,
    required int age,
    required String address,
    required this.studentID,
    required this.grade,
    required this.courseScores,
  }) : super(name: name, age: age, address: address, role: StudentRole());

  // Override the displayRole() method
  @override
  void displayRole() {
    print("Role: Student");
  }

  // Method to calculate the average score
  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }
}

class StudentRole implements Role {
  @override
  void displayRole() {
    print("Role: Student");
  }
}


//D
class Teacher extends Person implements Role {
  final String teacherID;
  final List<String> coursesTaught;

  // Constructor
  Teacher({
    required String name,
    required int age,
    required String address,
    required this.teacherID,
    required this.coursesTaught,
  }) : super(name: name, age: age, address: address, role: TeacherRole());

  // Override the displayRole() method
  @override
  void displayRole() {
    print("Role: Teacher");
  }

  // Method to display the courses taught
  void displayCoursesTaught() {
    print("Courses Taught: ${coursesTaught.join(", ")}");
  }
}

class TeacherRole implements Role {
  @override
  void displayRole() {
    print("Role: Teacher");
  }
}



//E
class StudentManagementSystem {
  static void main() {
    // Create instances of Student
    Student student1 = Student(
      name: "Alice",
      age: 20,
      address: "123 Main St",
      studentID: "S001",
      grade: "A",
      courseScores: [85.0, 90.0, 78.0],
    );

    // Create an instance of Teacher
    Teacher teacher1 = Teacher(
      name: "Bob",
      age: 40,
      address: "456 Elm St",
      teacherID: "T001",
      coursesTaught: ["Math", "Physics", "Chemistry"],
    );

    // Use displayRole method
    print("${student1.getName}'s Role:");
    student1.displayRole();
    print("Average Score: ${student1.calculateAverageScore()}");

    print("\n${teacher1.getName}'s Role:");
    teacher1.displayRole();
    teacher1.displayCoursesTaught();
  }
}

void main() {
  StudentManagementSystem.main();
}

