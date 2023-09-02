/* 1. Buatlah sebuah list dengan spesifikasi berikut:
    1. Tiap elemen wajib berupa list juga
    2. tiap element wajib terdapat 2 data(sub-elemen)
    3. Buatlah sebuah map dengan menggunakan list tersebut */

void main() {

  // membuat list 
  List<List<String>> listData = [ // elemen di listData adalah sebuah sub-list
    ['Nama', 'Mala'],
    ['Usia', '20'],
    ['NIM', '4312101127'],
    ['Asal', 'Batam'],
  ];

  // membuat Map dari listData
  Map<String, String> dataMap = Map.fromIterable(
    listData,
    key: (item) => item[0], // elemen pertama sebagai kunci
    value: (item) => item[1], // elemen kedua sebagai nilai
  );

  // menampilkan Map
  dataMap.forEach((key, value) {
    print('$key: $value');
  });
}
