// Soal Prioritas 1
// Soal Nomor 1
// class bangunRuang {
//   int? panjang;
//   int? lebar;
//   int? tinggi;

//   void volume() {}
// }

// class Kubus extends bangunRuang {
//   int? sisi;
// }

// class Balok extends bangunRuang {}


// Soal Nomor 2
class bangunRuang {
  int panjang = 15;
  int lebar = 10;
  int tinggi = 5;

  void volume() {}
}

class Kubus extends bangunRuang {
  int sisi = 10;

  @override
  void volume() {
    int volumeKubus = sisi * sisi * sisi;
    print('Volume Sebuah Kubus dengan sisi=$sisi adalah $volumeKubus');
  }
}

class Balok extends bangunRuang {
  @override
  void volume() {
    int volumeBalok = panjang * lebar * tinggi;
    print('Volume Sebuah Balok dengan p=$panjang, l=$lebar, dan t=$tinggi adalah $volumeBalok');
  }
}

void main() {
  var bangun = Kubus();
  bangun.volume();

  var bangun2 = Balok();
  bangun2.panjang = 15;
  bangun2.lebar = 10;
  bangun2.tinggi = 5;
  bangun2.volume();
}
