/* Buatlah sebuah program untuk menghitung frekuensi pada setiap data di dalam sebuah list. Frekuensi merupakan jumlah kemunculan data di dalam list

Sampel Input: [js,js,js,golang,python,js,js,golang,rust]

 Sampel Output: js: 5, golang: 2, python: 1, rust: 1 */

void main() {
  List<String> listData = ['js', 'js', 'js', 'golang', 'python', 'js', 'js', 'golang', 'rust'];
  Map<String, int> frekuensiData = {};

  for (String data in listData) {
    frekuensiData[data] = (frekuensiData[data] ?? 0) + 1;
  }

  String hasil = '';

  frekuensiData.forEach((key, value) {
    hasil += '$key: $value, ';
  });

  if (hasil.isNotEmpty) {
    hasil = hasil.substring(0, hasil.length - 2);
  }
  print(hasil);
}



