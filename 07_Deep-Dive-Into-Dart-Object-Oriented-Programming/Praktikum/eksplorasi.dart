abstract class BangunDatar {
  double getArea();
  double getPerimeter();
}

class Persegi implements BangunDatar {
  double sisi;

  Persegi(this.sisi);

  @override
  double getArea() {
    return sisi * sisi;
  }

  @override
  double getPerimeter() {
    return 4 * sisi;
  }
}

class Lingkaran implements BangunDatar {
  double radius;

  Lingkaran(this.radius);

  @override
  double getArea() {
    return 3.14 * radius * radius;
  }

  @override
  double getPerimeter() {
    return 2 * 3.14 * radius;
  }
}

class Segitiga implements BangunDatar {
  double alas;
  double tinggi;
  double sisi;

  Segitiga(this.alas, this.tinggi, this.sisi);

  @override
  double getArea() {
    return 0.5 * alas * tinggi;
  }

  @override
  double getPerimeter() {
    return 3 * sisi;
  }
}

void main() {
  var persegi = Persegi(5.0);
  var lingkaran = Lingkaran(7.0);
  var segitiga = Segitiga(4.0, 3.0, 5.0);

  print('Luas dan Keliling Bangun Datar:');
  print('Persegi - Luas: ${persegi.getArea()}, Keliling: ${persegi.getPerimeter()}');
  print('Lingkaran - Luas: ${lingkaran.getArea()}, Keliling: ${lingkaran.getPerimeter()}');
  print('Segitiga - Luas: ${segitiga.getArea()}, Keliling: ${segitiga.getPerimeter()}');
}
