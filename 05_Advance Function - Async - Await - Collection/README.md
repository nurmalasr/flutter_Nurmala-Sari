# Resume Advanced Function - Async - Await - Collection

1. Anonymous Function 
    - Tidak memiliki nama
    - Fungsi sebagai data di parameter
```
() {
    // perintah yang dijalankan saat fungsi dipanggil
}
```
```dart
var hello = () { // variabel
    print('hello'); // anonymous function
};

var jumlah = (int a, int b) {
    return a + b;
};

void main() {

    hello(); // memanggil anonymous function
    print(jumlah(1,2));
}
```

2. Arrow Function 
    - Dapat menulis function lebih ringkas
    - Dapat memiliki nama atau tidak
    - Berisi 1 data dari proses maupun data statis
    - Nilai return fungsi ini diambil dari data tersebut
`() => proses_yang_dijalankan_saat_fungsi_dipanggil();`

```dart
var hello = () => print('hello'); // fungsi hello melakukan print di dalamnya
var jumlah = (int a, int b) => a + b; 

void main() {

    hello();
    print(jumlah(1,2)); // fungsi jumlah memberi nilai saat dijalankan sehingga dapat dilakukan print
}
```

3. Async-Await
    - Menjalankan beberapa proses secara asinkron tanpa perlu menunggu proses lainnya selesai
    - Proses ditulis dalam bentuk fungsi
    - Await akan menunggu hingga proses Async selesai

4. Object **Future** untuk menunda eksekusi kode. Misal ada 2 fungsi, fungsi 1 diberi waktu 1 detik, maka fungsi 2 akan tampil dahulu baru fungsi 1

```dart
void P1 () {
    Future.delayed(Duration(seconds: 1)), () {
        print('hello dari P1');
    };
}

void P2 () {
    print('hello dari P2');
}

void main() {

    P1(); // P1 akan dijalankan belakangan
    P2(); // P2 akan selesai lebih dahulu, sehingga outputnya adalah hello dari P2 lalu hello dari P1
}
```

5. Proses sinkronus adalah program dijalankan secara berurutan dari atas sampai bawah. Keyword **Async-Await** bisa digunakan dengan **Future** untuk menulis proses asinkronus layaknya sinkronus

```dart
Future<void> P1 () async {
    await Future.delayed(Duration(seconds: 1)), () {
        print('hello dari P1');
    };
}

void P2 () {
    print('hello dari P2');
}

void main() async { // fungsi main menjadi async karena di dalamnya ada Await

    await P1();
    P2(); // P2 dijalankan belakangan setelah P1 selesai, sehingga outputnya P1 selesai lebih dulu
}
```

6. Tipe data **Future** dapat membuat suatu proses berjalannya fungsi dengan waktu atau durasi (data yang dapat ditunggu). Untuk mengembalikan data return dari **Future**, butuh keyword Async karena berjalan secara asinkronus

```dart
Future<String> P1 () {
    return Future.delayed(Duration(seconds: 1)), () {
        return 'hello dari P1'; // data yang di return
    };
}

void main() async {

    var data = await P1();
    print(data); // P1 menghasilkan Future yang di dalamnya terdapat sebuah String 
}
```

7. **Collection** adalah struktur data canggih untuk menangani masalah yang kompleks. Menyimpan kumpulan data pada satu tempat, jenis Collection :

## LIST
List menyimpan data secara berbaris dan setiap data di dalamnya memiliki index

```dart
void main() async {

    var scores = []; // membuat list
    scores.add(60);
    scores.add(80);
    scores.add(90); // menambah data
    scores.add(70);
    scores.add(85);
    print(scores);

    print(scores[0]);
    print(scores[1]);
    print(scores[2]); // mengambil data berdasarkan index
    print(scores[3]);
    print(scores[4]);
}
```
Menggunakan perulangan **For** untuk mengambil seluruh data di list tanpa menulis kode berulang kali
```dart
void main() async {

    var scores = [60, 80, 90, 70, 85]; // membuat list disertai data-datanya
    print(scores);

    for(var score in scores) {
        print(score); // mengambil seluruh data pada list 
    }
}
``` 

## MAP
Map menyimpan data secara key-value. Key berguna selayaknya index pada list. Setiap key punya valuenya masing-masing

```dart
void main() async {

    var student = {}; // membuat map
    student['name'] = 'Alex Under'; // menambah data
    student['age'] = 16;
    print(student);

    print(student['name']); // mengambil data berdasarkan key
    print(student['age']);
}
```
Menggunakan **For** untuk mengakses data pada Map
```dart
void main() async {

    var student = { // membuat Map beserta data-datanya
        'name' : 'Alex Under',
        'age' : 16
    };
    print(student);

    for(var key in student, keys) { // mengambil seluruh data pada list
        print(student[key]);
    }
}
```