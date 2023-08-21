void main() {
  var hargaBuku = 10000;
  var hargaPensil = 5000;
  var hargaTas = 100000;

  var jmlBuku = 1;
  var jmlPensil = 1;
  var jmlTas = 1;

  var ttlBarang = hitungttlBarang(jmlBuku, jmlPensil, jmlTas);
  var ttlHarga = hitungttlHarga(hargaBuku, hargaPensil, hargaTas, ttlBarang);
  var ttlHargaSetelahDiskon = hitungttlHargaSetelahDiskon(ttlHarga);

  print("Total Barang: $ttlBarang");
  print("Total Harga: $ttlHarga");
  print("Total Harga Setelah Diskon: $ttlHargaSetelahDiskon");
}

int hitungttlBarang(int jmlBuku, int jmlPensil, int jmlTas) {
  return jmlBuku + jmlPensil + jmlTas;
}
