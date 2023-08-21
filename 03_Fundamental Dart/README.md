# Resume Fundamental Dart

1. Dart adalah bahasa pemrograman untuk membuat sebuah aplikasi yang berjalan disisi client (Front-End), seperti Web, Desktop dan Mobile.

2. Keunggulan Dart :
    - Type safe, jaminan konsistensi tipe data
    - Null Safety, keamanan data bernilai hampa (null)
    - Rich standard library, banyak dukungan library internal
    - Multiplatform, berjalan pada berbagai jenis perangkat

3. Fungsi Main adalah bagian yang dijalankan pertama kali, tipe data void atau int. Tipe data **void** artinya tidak mengembalikan nilai

4. Komentar sebagai dokumentasi, catatan pada kode dan mencegah perintah dijalankan. Penulisannya dengan :
    - Single line command **//**
    - Multi line command **/*  */**

5.  Variabel seperti box yang menyimpan sebuah data atau nilai yang memiliki nama dan tipe data. Contoh : `int umur = 21;` 
    - int adalah **tipe data**
    - umur adalah **nama variabel**
    - 21 adalah **value**

6. `var usia;` menampilkan nilai *null* karena belum ada value. Cara menambahkan value `var usia = 18;`

7. Konstanta untuk menyimpan data, memiliki nama, tipe data dan nilainya tetap (tidak berubah). Contoh : `final usia = 18;` artinya value usia tidak dapat diubah-ubah

8. Tipe data yang dasar berupa **int, double, bool, String**
    - int : bilangan bulat
    - double : bilangan pecahan
    - bool : true/false
    - String : teks

9. String penulisan value diawali & diakhiri tanda kutip (' ')

10. Operator Comparison akan mengembalikan nilai boolean true/false

11. Operator Logical untuk menggabungkan beberapa kondisi yang menguji logika beberapa nilai boolean
    - && and
    - || or
    - ! not

12. Operator Not (!) mengembalikan nilai sebaliknya dari boolean. Contoh : 

```dart
bool notTrue = !true;
print(notTrue);
```
akan menampilkan outpul **false** karena pakai operator not (!)
