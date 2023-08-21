void main() {
  var hargaBuku = 10000;
  var hargaPensil = 5000;
  var hargaTas = 100000;

  var jmlBuku = 1;
  var jmlPensil = 1;
  var jmlTas = 1;

  var TotalBarang = hitungTotalBarang(jmlBuku, jmlPensil, jmlTas);
  var TotalHarga = hitungTotalHarga(hargaBuku, hargaPensil, hargaTas, TotalBarang);
  var TotalHargaSetelahDiskon = hitungTotalHargaSetelahDiskon(TotalHarga);

  print("Total Barang: $TotalBarang");
  print("Total Harga: $TotalHarga");
  print("Total Harga Setelah Diskon: $TotalHargaSetelahDiskon");
}

int hitungTotalBarang(int jmlBuku, int jmlPensil, int jmlTas) {
  return jmlBuku + jmlPensil + jmlTas;
}

int hitungTotalHarga(int hargaBuku, int hargaPensil, int hargaTas, int TotalBarang) {
  return (hargaBuku * TotalBarang) + (hargaPensil * TotalBarang) + (hargaTas * TotalBarang);
}

double hitungTotalHargaSetelahDiskon(int TotalHarga) {
  double diskon = 0.10; // 10% diskon
  double potonganDiskon = TotalHarga * diskon;
  return TotalHarga - potonganDiskon;
}
