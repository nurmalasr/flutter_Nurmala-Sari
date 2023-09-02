/* 1. Buatlah sebuah fungsi dengan spesifikasi berikut:
    1. Menerima 2 parameter, yaitu list data dan pengali
    2. Lakukan perulangan pada list data secara asynchronous
    3. Tiap perulangan, kalikan elemen list data dengan pengali
    4. Return list baru yang berisi hasil proses diatas */

Future<List<int>> listPengali(List<int> data, int pengali) async { // fungsi listPengali menerima 2 parameter yaitu data & pengali
  List<int> result = [];

  for (int elemen in data) {
    // menunggu hasil perkalian secara asinkron
    await Future.delayed(Duration(milliseconds: 55)); // penundaan asinkron dalam loop 
    int elemenPengali = elemen * pengali;
    result.add(elemenPengali);
  }

  return result;
}

void main() async {
  List<int> listData = [5, 9, 2, 9];
  int pengali = 2; // mengalikan listData dengan pengali 

  List<int> hasilPengali = await listPengali(listData, pengali);

  print('List awal adalah $listData');
  print('List baru hasil proses perkalian adalah $hasilPengali');
}