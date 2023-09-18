// Soal Prioritas 1

// Soal Branching (Percabangan)
import 'dart:io';

String nilaiToHuruf(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40) {
    return "Nilai B";
  } else if (nilai > 0) {
    return "Nilai C";
  } else {
    return "";
  }
}

void main() {
  print("Input nilai: ");
  int nilaiMahasiswa = int.parse(stdin.readLineSync()!);

  String hasil = nilaiToHuruf(nilaiMahasiswa);
  print("Hasil konversi nilai: $hasil");
}

// //Soal Looping (Perulangan)
// void main() {
//   for (int i = 1; i <= 10; i++) {
//     print(i);
//   }
// }


// // Soal Prioritas 2

// // Tugas Looping (Perulangan)
// // Nomor 1
// import 'dart:io';

// void printn(String text) {
//   stdout.write(text);
// }

// void main() {
//   int height = 8;
//   int star = 1;

//   for (int i = 1; i <= height; i++) {
//     for (int j = 1; j <= height - i; j++) {
//       printn(" ");
//     }
//     for (int k = 1; k <= star; k++) {
//       printn("*");
//     }
//     star += 2;
//     print("");
//   }
// }

// //Nomor 2
// import 'dart:io';

// void printn(String text) {
//   stdout.write(text);
// }

// void main() {
//   int height = 11;
//   // Section Atas
//   for (int i = 1; i <= (height + 1) ~/ 2; i++) {
//     for (int j = 1; j < i; j++) {
//       printn(" ");
//     }
//     for (int k = 1; k <= height - 2 * (i - 1); k++) {
//       printn("0");
//     }
//     print("");
//   }

//   // Section Bawah
//   for (int i = (height + 1) ~/ 2 - 1; i >= 1; i--) {
//     for (int j = i - 1; j >= 1; j--) {
//       printn(" ");
//     }
//     for (int k = height - 2 * (i - 1); k >= 1; k--) {
//       printn("0");
//     }
//     print("");
//   }
// }


// // Tugas Function (Fungsi)
// // Nomor 1
// import 'dart:math';

// double LuasLingkaran(double r) {
//   return pi * r * r;
// }

// void main() {
//   double jariLingkaran = 7.0;
//   double luas = LuasLingkaran(jariLingkaran);
//   print("Luas lingkaran dengan jari-jari (r) = $jariLingkaran adalah $luas");
// }

// // Nomor 2
// void main() {
//   List<int> values = [10, 40, 50];

//   for (int value in values) {
//     int factor = 1;
//     for (int i = 1; i <= value; i++) {
//       factor *= i;
//     }
//     print("Faktorial $value adalah $factor");
//   }
// }


// // Soal Eksplorasi
// // Nomor 1

// import 'dart:io';

// void main() {
//   stdout.write("Input sebuah bilangan: ");
//   int number = int.parse(stdin.readLineSync()!);

//   if (isPrime(number)) {
//     print("$number adalah bilangan prima.");
//   } else {
//     print("$number bukan bilangan prima.");
//   }
// }

// bool isPrime(int num) {
//   if (num <= 1) {
//     return false;
//   }
  
//   for (int i = 2; i <= num / 2; i++) {
//     if (num % i == 0) {
//       return false;
//     }
//   }
  
//   return true;
// }

// // Nomor 2
// import 'dart:io';

// void main() {
//   stdout.write("Input angka untuk tabel perkalian: ");
//   int number = int.parse(stdin.readLineSync()!);
//   printTable(number);
// }

// void printTable(int n) {
//   for (int i = 1; i <= n; i++) {
//     for (int j = 1; j <= n; j++) {
//       stdout.write((i * j).toString().padLeft(4)); // Menggunakan padLeft untuk adjusting lebar kolom
//     }
//     print(""); // Pindah ke baris baru setelah setiap baris selesai
//   }
// }

