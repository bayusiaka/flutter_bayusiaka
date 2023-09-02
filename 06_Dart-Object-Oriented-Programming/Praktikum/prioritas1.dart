class Hewan {
  double berat;
  Hewan(this.berat);
}

class KendaraanMuatan {
  double kapasitas;
  List<Hewan> muatan = [];
  KendaraanMuatan(this.kapasitas);

  double muatanTotal() {
    double total = 0;
    for (var hewan in muatan) {
      total += hewan.berat;
    }
    return total;
  }

  void addMuatan(Hewan hewan) {
    if (muatanTotal() + hewan.berat <= kapasitas) {
      muatan.add(hewan);
      print("Hewan telah dimuat ke dalam Mobil Truk.");
    } else {
      print("Kapasitas kendaraan penuh!");
    }
  }
}

void main() {
  var mobilTruk = KendaraanMuatan(2500); //max 2500 kg

  var sapi = Hewan(450);
  var kuda = Hewan(180);
  var kerbau = Hewan(370);
  var banteng = Hewan(500);
  var badak = Hewan(700);

  mobilTruk.addMuatan(sapi);
  mobilTruk.addMuatan(kuda);
  mobilTruk.addMuatan(kerbau);
  mobilTruk.addMuatan(banteng);
  mobilTruk.addMuatan(badak);

  print("Total berat muatan dalam kendaraan: ${mobilTruk.muatanTotal()} kg");
}
