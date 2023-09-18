// Disclaimer: code ini saya buat terpisah satu sama lain sebelum digabung menjadi satu hehe, thankyouuu
// Soal Prioritas 1 //

// // Soal Nomor 1
// import 'dart:io';
// // Menghitung keliling dan luas persegi
// double hitungKelilingPersegi(double sisi) {
//   return 4 * sisi;
// }

// double hitungLuasPersegi(double sisi) {
//   return sisi * sisi;
// }

// // Menghitung keliling dan luas persegi panjang
// double hitungKelilingPersegiPanjang(double panjang, double lebar) {
//   return 2 * (panjang + lebar);
// }

// double hitungLuasPersegiPanjang(double panjang, double lebar) {
//   return panjang * lebar;
// }

// void main() {
//   stdout.write("Input Nilai Sisi Persegi: ");
//   double sisiPersegi = double.parse(stdin.readLineSync()!);

//   stdout.write("Input Panjang Persegi Panjang: ");
//   double panjangPersegiPanjang = double.parse(stdin.readLineSync()!);

//   stdout.write("Input Lebar Persegi Panjang: ");
//   double lebarPersegiPanjang = double.parse(stdin.readLineSync()!);

//   double kelilingPersegi = hitungKelilingPersegi(sisiPersegi);
//   double luasPersegi = hitungLuasPersegi(sisiPersegi);

//   double kelilingPersegiPanjang = hitungKelilingPersegiPanjang(panjangPersegiPanjang, lebarPersegiPanjang);
//   double luasPersegiPanjang = hitungLuasPersegiPanjang(panjangPersegiPanjang, lebarPersegiPanjang);

//   print("Keliling Persegi: $kelilingPersegi");
//   print("Luas Persegi: $luasPersegi");

//   print("Keliling Persegi Panjang: $kelilingPersegiPanjang");
//   print("Luas Persegi Panjang: $luasPersegiPanjang");
// }


// //Soal Nomor 2
import 'dart:io';
import 'dart:math';
// Menghitung keliling lingkaran
double hitungKelilingLingkaran(double radius) {
  return 2 * pi * radius;
}

Menghitung luas lingkaran
double hitungLuasLingkaran(double radius) {
  return pi * radius * radius;
}

void main() {
  stdout.write("Input jari-jari lingkaran: ");
  double radius = double.parse(stdin.readLineSync()!);

  double keliling = hitungKelilingLingkaran(radius);
  double luas = hitungLuasLingkaran(radius);

  print("Keliling Lingkaran: $keliling");
  print("Luas Lingkaran: $luas");
}

// // Soal Prioritas 2 //

// // Soal Nomor 1
//import 'dart:io';

// void main() {
//   stdout.write("Input Kata Pertama: ");
//   String variabel1 = stdin.readLineSync()!;

//   stdout.write("Input Kata Kedua: ");
//   String variabel2 = stdin.readLineSync()!;

//   stdout.write("Input Kata Ketiga: ");
//   String variabel3 = stdin.readLineSync()!;

//   String hasilGabungan = variabel1 + " " + variabel2 + " " + variabel3;

//   print("Hasil gabungan: $hasilGabungan");
// }

// // Soal Nomor 2
// import 'dart:io';
// import 'dart:math';

// void main() {
//   stdout.write("Input Jari-jari Tabung: ");
//   double jariJari = double.parse(stdin.readLineSync()!);

//   stdout.write("Input Tinggi Tabung: ");
//   double tinggi = double.parse(stdin.readLineSync()!);

//   double volume = hitungVolumeTabung(jariJari, tinggi);

//   print("Volume Tabung: $volume");
// }

// double hitungVolumeTabung(double jariJari, double tinggi) {
//   return pi * jariJari * jariJari * tinggi;
// }


// //Soal Eksplorasi

// //Soal Nomor 1
// import 'dart:io';

// void main() {
//   stdout.write("Input Kata: ");
//   String kata = stdin.readLineSync()!.toLowerCase();

//   if (isPalindrome(kata)) {
//     print("Palindrom");
//   } else {
//     print("Bukan Palindrom");
//   }
// }

// bool isPalindrome(String kata) {
//   int i = 0;
//   int j = kata.length - 1;

//   while (i < j) {
//     if (kata[i] != kata[j]) {
//       return false;
//     }
//     i++;
//     j--;
//   }

//   return true;
// }

// //Soal Nomor 2\
// import 'dart:io';

// void main() {
//   stdout.write("Input Bilangan: ");
//   int bilangan = int.parse(stdin.readLineSync()!);

//   print("Faktor dari $bilangan adalah:");
//   for (int i = 1; i <= bilangan; i++) {
//     if (bilangan % i == 0) {
//       print(i);
//     }
//   }
// }