// Nomor 1
// import 'dart:io';

// class Calculator {
//   double operasi(double a, double b, String operator) {
//     if (operator == '+') {
//       return a + b;
//     } else if (operator == '-') {
//       return a - b;
//     } else if (operator == '*') {
//       return a * b;
//     } else if (operator == '/') {
//       if (b == 0) {
//         throw Exception("Pembagian oleh nol tidak valid.");
//       }
//       return a / b;
//     } else {
//       throw Exception("Operator tidak valid.");
//     }
//   }
// }

// void main() {
//   var calculator = Calculator();

//   print("Input angka pertama:");
//   var angka1 = double.parse(stdin.readLineSync()!);

//   print("Input operator (+, -, *, /):");
//   var operator = stdin.readLineSync()!;

//   print("Input angka kedua:");
//   var angka2 = double.parse(stdin.readLineSync()!);

//   try {
//     var hasil = calculator.operasi(angka1, angka2, operator);
//     print("Hasil: $hasil");
//   } catch (e) {
//     print("Error: $e");
//   }
// }


// Nomor 2
class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> courses = [];

  Student(this.nama, this.kelas);

  void tambahCourse(Course course) {
    courses.add(course);
    print("Course '${course.judul}' berhasil ditambahkan.");
  }

  void hapusCourse(Course course) {
    if (courses.contains(course)) {
      courses.remove(course);
      print("Course '${course.judul}' berhasil dihapus.");
    } else {
      print("Course '${course.judul}' tidak ditemukan.");
    }
  }

  void lihatCourses() {
    print("Courses for $nama ($kelas):");
    for (var i = 0; i < courses.length; i++) {
      print("${i + 1}. ${courses[i].judul}");
    }
  }
}

void main() {
  var student = Student("bayusiaka", "C");

  var course1 = Course("Mobile Apps", "Pengembangan aplikasi mobile dengan Flutter.");
  var course2 = Course("Web Programming", "Pengembangan website dengan React.");
  var course3 = Course("Data Analyst", "Pembelajaran Data Analyst untuk pemula.");

  student.tambahCourse(course1);
  student.tambahCourse(course2);
  student.tambahCourse(course3);

  student.lihatCourses();

  student.hapusCourse(course2);

  student.lihatCourses();
}
