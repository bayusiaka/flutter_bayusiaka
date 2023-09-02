class Buku {
  int id;
  String judul;
  String penerbit;
  double harga;
  String kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);
}

class TokoBuku {
  List<Buku> daftarBuku = [];
  int _nextId = 1;

  void tambahBuku(String judul, String penerbit, double harga, String kategori) {
    var buku = Buku(_nextId, judul, penerbit, harga, kategori);
    daftarBuku.add(buku);
    _nextId++;
    print("Buku '${buku.judul}' berhasil ditambahkan dengan ID ${buku.id}.");
  }

  List<Buku> semuaBuku() {
    return daftarBuku;
  }

  void hapusBuku(int id) {
    try {
      var bukuToRemove = daftarBuku.firstWhere((buku) => buku.id == id);
      daftarBuku.remove(bukuToRemove);
      print("Buku '${bukuToRemove.judul}' dengan ID $id berhasil dihapus.");
    } catch (e) {
      print("Buku dengan ID $id tidak ditemukan.");
    }
  }
}

void main() {
  var tokoBuku = TokoBuku();

  tokoBuku.tambahBuku("Harry Potter", "Prisoner of Azkaban", 95000, "Fantasi");
  tokoBuku.tambahBuku("The Hunger Games", "Suzanne Collins", 120000, "Dystopian");
  tokoBuku.tambahBuku("To Kill a Mockingbird", "Harper Lee", 80000, "Fiksi Klasik");

  var semuaBuku = tokoBuku.semuaBuku();
  print("Daftar Semua Buku:");
  for (var buku in semuaBuku) {
    print("ID: ${buku.id}, Judul: ${buku.judul}, Penerbit: ${buku.penerbit}, Harga: \Rp.${buku.harga}, Kategori: ${buku.kategori}");
  }

  tokoBuku.hapusBuku(2);

  print("\nDaftar Semua Buku setelah Menghapus:");
  for (var buku in semuaBuku) {
    print("ID: ${buku.id}, Judul: ${buku.judul}, Penerbit: ${buku.penerbit}, Harga: \Rp.${buku.harga}, Kategori: ${buku.kategori}");
  }
}
