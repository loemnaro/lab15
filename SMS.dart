import 'dart:io';

class Student {
  int id;
  String name;
  int age;
  String grade;

  Student({
    required this.id,
    required this.name,
    required this.age,
    required this.grade,
  });

  @override
  String toString() {
    return 'ID: $id, Name: $name, Age: $age, Grade: $grade';
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Student && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

void main() {
  int storageOption;

  do {
    print("\nStudent Management System");
    print("Storage:");
    print("1. List");
    print("2. Set");
    print("3. Map");
    print("0. Exit");
    stdout.write("Select your option: ");
    storageOption = int.parse(stdin.readLineSync()!);

    switch (storageOption) {
      case 1:
        studentMenuList();
        break;
      case 2:
        studentMenuSet();
        break;
      case 3:
        studentMenuMap();
        break;
      case 0:
        print("Exiting...");
        break;
      default:
        print("Invalid option!");
    }
  } while (storageOption != 0);
}

void studentMenuList() {
  List<Student> students = [];
  int option;

  do {
    print("\nStudent Management System [Storage: List]");
    print("1. List all students");
    print("2. Add new student");
    print("3. Update an existing student");
    print("4. Delete (a) student(s)");
    print("5. Back");
    stdout.write("Select your option: ");
    option = int.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        if (students.isEmpty) {
          print("No students found.");
        } else {
          print("\nList of Students:");
          students.forEach((s) => print(s));
        }
        break;
      case 2:
        students.add(createStudent());
        print("Student added successfully.");
        break;
      case 3:
        updateStudentList(students);
        break;
      case 4:
        deleteStudentList(students);
        break;
      case 5:
        print("Back to main menu...");
        break;
      default:
        print("Invalid option!");
    }
  } while (option != 5);
}

Student createStudent() {
  stdout.write("Enter ID: ");
  int id = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Name: ");
  String name = stdin.readLineSync()!;
  stdout.write("Enter Age: ");
  int age = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Grade: ");
  String grade = stdin.readLineSync()!;
  return Student(id: id, name: name, age: age, grade: grade);
}

void updateStudentList(List<Student> students) {
  stdout.write("Enter student ID to update: ");
  int id = int.parse(stdin.readLineSync()!);
  Student? student =
      students.firstWhere((s) => s.id == id, orElse: () => Student(id: -1, name: '', age: 0, grade: ''));
  if (student.id == -1) {
    print("Student not found.");
    return;
  }
  stdout.write("Enter new Name: ");
  student.name = stdin.readLineSync()!;
  stdout.write("Enter new Age: ");
  student.age = int.parse(stdin.readLineSync()!);
  stdout.write("Enter new Grade: ");
  student.grade = stdin.readLineSync()!;
  print("Student updated successfully.");
}

void deleteStudentList(List<Student> students) {
  stdout.write("Enter student ID to delete: ");
  int id = int.parse(stdin.readLineSync()!);
  students.removeWhere((s) => s.id == id);
  print("Student deleted successfully.");
}


void studentMenuSet() {
  Set<Student> students = {};
  int option;

  do {
    print("\nStudent Management System [Storage: Set]");
    print("1. List all students");
    print("2. Add new student");
    print("3. Update an existing student");
    print("4. Delete (a) student(s)");
    print("5. Back");
    stdout.write("Select your option: ");
    option = int.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        if (students.isEmpty) {
          print("No students found.");
        } else {
          print("\nList of Students:");
          students.forEach((s) => print(s));
        }
        break;
      case 2:
        students.add(createStudent());
        print("Student added successfully.");
        break;
      case 3:
        updateStudentSet(students);
        break;
      case 4:
        deleteStudentSet(students);
        break;
      case 5:
        print("Back to main menu...");
        break;
      default:
        print("Invalid option!");
    }
  } while (option != 5);
}

void updateStudentSet(Set<Student> students) {
  stdout.write("Enter student ID to update: ");
  int id = int.parse(stdin.readLineSync()!);
  Student? student =
      students.firstWhere((s) => s.id == id, orElse: () => Student(id: -1, name: '', age: 0, grade: ''));
  if (student.id == -1) {
    print("Student not found.");
    return;
  }
  students.remove(student); 
  Student updated = createStudent(); 
  students.add(updated);
  print("Student updated successfully.");
}

void deleteStudentSet(Set<Student> students) {
  stdout.write("Enter student ID to delete: ");
  int id = int.parse(stdin.readLineSync()!);
  students.removeWhere((s) => s.id == id);
  print("Student deleted successfully.");
}


void studentMenuMap() {
  Map<int, Student> students = {};
  int option;

  do {
    print("\nStudent Management System [Storage: Map]");
    print("1. List all students");
    print("2. Add new student");
    print("3. Update an existing student");
    print("4. Delete (a) student(s)");
    print("5. Back");
    stdout.write("Select your option: ");
    option = int.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        if (students.isEmpty) {
          print("No students found.");
        } else {
          print("\nList of Students:");
          students.forEach((key, value) => print(value));
        }
        break;
      case 2:
        Student student = createStudent();
        students[student.id] = student;
        print("Student added successfully.");
        break;
      case 3:
        stdout.write("Enter student ID to update: ");
        int id = int.parse(stdin.readLineSync()!);
        if (!students.containsKey(id)) {
          print("Student not found.");
        } else {
          Student updated = createStudent();
          students[id] = updated;
          print("Student updated successfully.");
        }
        break;
      case 4:
        stdout.write("Enter student ID to delete: ");
        int id = int.parse(stdin.readLineSync()!);
        students.remove(id);
        print("Student deleted successfully.");
        break;
      case 5:
        print("Back to main menu...");
        break;
      default:
        print("Invalid option!");
    }
  } while (option != 5);
}
