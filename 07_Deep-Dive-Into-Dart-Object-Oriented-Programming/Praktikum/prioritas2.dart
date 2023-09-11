// Soal Prioritas 2
// Soal Nomor 1
// class Matematika {
//   void hasil() {}
// }
// abstract class KelipatanPersekutuanTerkecil implements Matematika {
//   int? x;
//   int? y;
//   int kelipatanPersekutuanTerkecil(int x, int y);
// }
// abstract class FaktorPersekutuanTerbesar implements Matematika {
//   int? x;
//   int? y;
//   int faktorPersekutuanTerbesar(int x, int y);
// }

// Soal Nomor 2
import 'dart:io';

class Matematika {
  void hasil() {}
}
abstract class KelipatanPersekutuanTerkecil implements Matematika {
  int? x;
  int? y;
  int kelipatanPersekutuanTerkecil(int x, int y);
}
abstract class FaktorPersekutuanTerbesar implements Matematika {
  int? x;
  int? y;
  int faktorPersekutuanTerbesar(int x, int y);
}

class OperasiMatematika
    implements KelipatanPersekutuanTerkecil, FaktorPersekutuanTerbesar {
  int? x;
  int? y;

  @override
  int kelipatanPersekutuanTerkecil(int x, int y) {
    // Implementasi untuk mencari Kelipatan Persekutuan Terkecil (KPK)
    int kpk = 0;
    int max = x > y ? x : y;

    while (true) {
      if (max % x == 0 && max % y == 0) {
        kpk = max;
        break;
      }
      max++;
    }

    return kpk;
  }

  @override
  int faktorPersekutuanTerbesar(int x, int y) {
    // Implementasi untuk mencari Faktor Persekutuan Terbesar (FPB)
    while (x != y) {
      if (x > y) {
        x = x - y;
      } else {
        y = y - x;
      }
    }
    return x;
  }

  void hasil() {
    print(
        'Hasil Kelipatan Persekutuan Terkecil (KPK): ${kelipatanPersekutuanTerkecil(x!, y!)}');
    print(
        'Hasil Faktor Persekutuan Terbesar (FPB): ${faktorPersekutuanTerbesar(x!, y!)}');
  }
}

void main() {
  OperasiMatematika operasi = OperasiMatematika();

  stdout.write('Masukkan nilai x: ');
  operasi.x = int.parse(stdin.readLineSync()!);

  stdout.write('Masukkan nilai y: ');
  operasi.y = int.parse(stdin.readLineSync()!);

  operasi.hasil();
}