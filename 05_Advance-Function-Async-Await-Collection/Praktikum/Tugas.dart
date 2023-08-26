// Soal Prioritas 1
// Nomor 1
Future<List<int>> multiplyList(List<int> data, int multiplier) async {
  List<int> result = [];

  for (int element in data) {
    await Future.delayed(Duration(milliseconds: 500));
    result.add(element * multiplier);
  }
  return result;
}

void main() async {
  List<int> inputList = [1, 2, 3, 4, 5];
  int multiplier = 10;

  List<int> resultList = await multiplyList(inputList, multiplier);
  print("Input List: $inputList");
  print("Result List: $resultList");
}

// Soal Prioritas 2
// Nomor 1
void main() {
  List<List<String>> laguList = [
    ['Leave The Door Open', 'Pop'],
    ['Highway to Hell', 'Rock'],
    ['Fly Me to the Moon', 'Jazz'],
    ['Young, Wild and Free', 'Hip-Hop'],
    ['Nocturnes', 'Klasik'],
  ];

  Map<String, String> songMap = {};
  for (var laguData in laguList) {
    songMap[laguData[0]] = laguData[1];
  }

  // Cetak list jenis lagu
  print('List Jenis Lagu:');
  for (var laguData in laguList) {
    print('Jenis Lagu: ${laguData[0]}, Genre: ${laguData[1]}');
  }

  print('\nMap Jenis Lagu:');
  songMap.forEach((jenisLagu, genre) {
    print('Jenis Lagu: $jenisLagu, Genre: $genre');
  });
}


// Nomor 2
import 'dart:math';

void main() {
  List<int> nilaiList = [7, 5, 3, 5, 2, 1];

  int totalNilai = 0;
  for (int nilai in nilaiList) {
    totalNilai += nilai;
  }

  double rataRata = totalNilai / nilaiList.length;
  int rataRataBulat = rataRata.ceil();

  print("Nilai: $nilaiList");
  print("Rata-rata: $rataRata");
  print("Rata-rata Bulat: $rataRataBulat");
}


// Nomor 3
import 'dart:async';
import 'dart:io';

void main() {
  stdout.write('Input angka: ');
  String input = stdin.readLineSync()!;
  int angka = int.parse(input);

  hitungFaktorial(angka).then((faktorial) {
    print('Faktorial dari $angka adalah $faktorial');
  });
}

Future<int> hitungFaktorial(int n) async {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * await hitungFaktorial(n - 1);
  }
}


// Soal Eksplorasi
// Nomor 1
void main() {
  List<String> input1 = [
    'amuse','tommy kaira','spoon','HKS','litchfield','amuse','HKS'
  ];
  List<String> output1 = deleteDupe(input1);
  print('Output 1: $output1');

  List<String> input2 = [
    'JS Racing','amuse','spoon','spoon','JS Racing','amuse'
  ];
  List<String> output2 = deleteDupe(input2);
  print('Output 2: $output2');
}

List<String> deleteDupe(List<String> input) {
  return input.toSet().toList();
}


// Nomor 2
void main() {
  List<String> inputData = ['js', 'js', 'js', 'golang', 'python', 'js', 'js', 'golang', 'rust'];
  Map<String, int> frekuensi = hitungFrekuensi(inputData);

  frekuensi.forEach((data, jumlah) {
    print('$data: $jumlah');
  });
}

Map<String, int> hitungFrekuensi(List<String> data) {
  Map<String, int> frekuensiMap = {};
  for (String item in data) {
    if (frekuensiMap.containsKey(item)) {
      frekuensiMap[item] = frekuensiMap[item]! + 1;
    } else {
      frekuensiMap[item] = 1;
    }
  }
  return frekuensiMap;
}

