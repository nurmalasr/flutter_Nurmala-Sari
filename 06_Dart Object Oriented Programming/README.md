# Resume Dart Object Oriented Programming

1. OOP adalah paradigma pemrograman yang berkonsep objek, dimana dapat memvisualisasikan dunia nyata ke bentuk komputer
    - program disusun dalam bentuk abstraksi object, dapat menyebutkan property dan method yang relevan tanpa detailnya
    - data dan proses diletakkan pada abstraksi tersebut

2. Keuntungan menggunakan OOP adalah mudah di troubleshoot jika ada error tanpa harus mengecek perbaris dan mudah digunakan ulang 

3. Bagian-bagian pada OOP :

## CLASS
- Abstraksi/gambaran dari sebuah benda (object)
- Memiliki ciri-ciri disebut **Property**
- Memiliki sifat dan kemampuan disebut **Method**

Membuat class :
- Menggunakan kata kunci `class`
- Memiliki nama dan diawali huruf besar
- Detail `class` diletakkan dalam kurawal

```dart
class Hewan {
    // property
    //method
}
```

Membuat Object berdasarkan class tersebut :
- Bentuk sebenarnya dari class
- Disebut **instance of class** menyimpan object pada variable
- Diperlakukan sebagai data

```dart
void main() {

    var h1 = Hewan();
    var h2 = Hewan();
    var h3 = Hewan();
}
```

## PROPERTY
- Ciri-ciri suatu `class`
- Hal-hal yang dimiliki `class` untuk menggambarkan suatu Object, e.g : nama, usia, berat badan, warna bulu, dll
- Memiliki sifat seperti variabel seperti menentukan tipe data, inisialisasi nilai atau bisa dibuat null-able dgn diberi tanda "?" setelah tipe datanya

```dart
class Hewan {
    var mata = 0;
    var kaki = 0;
}
```
Mengakses Property seperti menggunakan variabel tapi melalui sebuah Object
```dart
void main() {

    var h1 = Hewan();
    print(h1.mata);
}
```
Misalnya :
```dart
class Hewan {
    int mata = 2;
    int kaki = 4;
}

void main() {
    var h1 = Hewan();
    print(h1.mata);
    print(h1.kaki);
}
```

## METHOD
- Sifat/perilaku suatu `class`
- Aktivitas yang dapat dikerjakan suatu `class`, e.g : hewan dapat bersuara, makan, tidur, dll
- Memiliki sifat seperti **fungsi** bisa tambahkan parameter dan return value
Membuat method seperti fungsi namun terletak di dalam `class` :
```dart
class Hewan {
    void bersuara() {
        print('');
    }
}
```
Untuk menjalankan Method seperti menggunakan fungsi tapi melalui sebuah object :
```dart
void main() {

    var h1 = Hewan();
    h1.bersuara();
}
```
Contoh implementasinya :
```dart
class Sapi {
    void main() {
        print('Makan');
    }
}

void main() {
    var h1 = Sapi();
    h1.makan();
}
```
