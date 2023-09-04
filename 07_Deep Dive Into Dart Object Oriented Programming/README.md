# Resume Deep Dive Into Dart Object Oriented Programming

## Constructor 
- Digunakan untuk menkostruksi **Object** baru
- Fungsi/Method yang dijalankan saat pembuatan Object
- Dapat menerima parameter
- Tidak memiliki return dan kata kunci/tipe data void
- Nama sama dengan nama `class`

Memberi **Constructor** dengan menambahkan method menggunakan nama yang sama dengan nama `class` :
```dart
class Hewan {
    var mata;
    var kaki;

    Hewan() { // Constructor
        mata = 0;
        kaki = 0;
    }
}
```
Contoh implementasi kode :
```dart
class Hewan {
    int? mata; //null-able
    int? kaki; //null-able

    Hewan() {
        mata = 0;
        kaki = 0;
    }
}

void main() {
    var hewan = Hewan();
    print(hewan.mata);
    print(hewan.kaki);
}
```

## INHERITANCE (Pewarisan)
- Membuat `class` baru dengan memanfaatkan `class` yang sudah ada
- Bertujuan agar kemampuan `class` yang ada dapat dimiliki `class` baru
- Analoginya adalah anak yang mewarisi sifat dari orang tua, dimana yang mewarisi sebagai `class` Anak sedangkan menurunkan disebut sebagai `class` Induk

Melakukan **Inheritance** dengan menambahkan keyword `extends` saat pembuatan class baru :
```dart
class Kambing extends Hewan {
    Kambing() {
        mata = 2;
        kaki = 4;
    }
}
```
Dalam penggunaan class, proses membuat Object dari `class` yang terjadi inheritance seperti pembuatan Object pada umumnya 
```dart
void main() {

    var k1 = Kambing();
    print(k1.mata);

    var h1 = Hewan();
    print(h1.mata);
}
```

## METHOD OVERRIDING
- Menulis ulang method yang ada pada **super-class**
- Bertujuan agar class memiliki method yang sama, dengan proses yang berbeda

Melakukan Overriding :
    - Dilakukan pada class yang melakukan inheritance 
    - Method sudah ada pada class induk
    - Method ditulis ulang seperti membuat method baru pada class anak
    - Ditambahkan tanda `@override` di baris sebelum method dibuat

```dart
class Hewan {
    reproduksi() {
        print('tidak diketahui');
    }

    bernapas() {
        print('tidak diketahui');
    }
}

class Kambing extends Hewan {
    @override 
    reproduksi() {
        print('melahirkan');
    }

    @overrride
    bernapas() {
        print('paru-paru');
    }
}
```
Saat menggunakan `class`, proses membuat Object dari class yang terjadi inheritance seperti pembuatan Object pada umumnya :
```dart
void main() {

    var k1 = Kambing();
    k1.reproduksi();
    k1.bernapas();

    var h1 = Hewan();
    h1.reproduksi();
    h1.bernapas(); 
}
```

## INTERFACE
- Berupa `class`
- Menunjukkan method apa aja yang ada pada suatu `class`
- Seluruh method wajib di `@override`
- Digunakan dengan menggunakan `implements`

Menggunakan **Interface** :
    - Sekilas mirip inheritance
    - Pada class yang melakukan implements, wajib melakukan override semua method yang ada pada class induk

```dart
class Hewan {
    reproduksi() {
        print('tidak diketahui');
    }

    bernapas() {
        print('tidak diketahui');
    }
}
```
```dart
class Kambing implements Hewan {
    @override
    reproduksi() {
    print('melahirkan');
}

    @override 
    bernapas() {
    print('paru-paru');
}
}
```
```dart
void main() {

    var k1 = Kambing();
    k1.reproduksi();
    k1.bernapas();

    var h1 = Hewan();
    h1.reproduksi();
    h1.bernapas();

}
```

## ABSTRACT CLASS
- Berupa class abstrak/gambaran umum
- Dapat menurunkan semua Property & Methodnya yang dimiliki class abstract
- Menunjukkan method apa saja yang ada pada suatu class
- Digunakan dengan menggunakan `extends`
- Tidak dapat dibuat Object
- Tidak semua method harus di `@override`

```dart
abstract class Hewan {
    reproduksi() {
        print('tidak diketahui');
    }

    bernapas() {
        print('tidak diketahui');
    }
}
```
```dart
class Kambing extends Hewan {
    @override
    reproduksi() {
        print('melahirkan');
    }
}
```
```dart
void main() {

    var k1 = Kambing();
    k1.reproduksi();
    k1.bernapas();

}
```
Abstract class tidak dapat digunakan untuk membentuk Object, sehingga menyebabkan error :
```dart
void main() {

    var k1 = Kambing();
    k1.reproduksi();
    k1.bernapas();

    // error
    var h1 = Hewan(); // outputnya akan menampilkan error : the class 'Hewan' is abstract 
}
```

## POLYMORPHISM
- Kemampuan data/Object berubah menjadi bentuk lain
- Tipe data yang dapat digunakan adalah super class
- Dapat dilakukan pada class dengan `extends` atau `implements`

Untuk melakukan Polymorphism, membuat Object dari `class` Kambing dengan tipe data `class` Hewan :
```dart
void main() {

    Hewan k1 = Kambing();
    k1.reproduksi();
    k1.bernapas();

}
```

## GENERICS
- Dapat digunakan pada class atau fungsi
- Memberi kemampuan menambahkan parameter agar dapat menerima data dengan tipe yang berbeda
- Tipe data yang diinginkan, ditentukan saat membuat class atau menjalankan fungsi

Membuat class dengan generics :
    - `class` Hadiah dapat dimasukkan data dengan tipe T
    - Tipe T (type) dapat digunakan di seluruh `class` Hadiah
```dart
class Hadiah<T> { // dapat diganti dengan String, boolean, dll
    var isi;

    Hadiah(T i) {
        isi = i;
    }
}
```

Menggunakan class dengan generics yaitu setelah nama class, menjadi tempat tipe data yang diinginkan :
```dart
void main() {

    var h1 = Hadiah<String>('mobil');
    print(h1.isi);

    var h2 = Hadiah<int>(10);
    print(h2.isi);
}
```

Membuat Fungsi dengan Generics dengan cara setelah nama fungsi, menjadi tempat variabel Generics :
```dart
void cekTipe<T>(T data) { // jadi fungsi general dmn tipe data dapat diubah-ubah
    print(data.runtimeType); // runtype untuk mengecek tipe data dari nilai yang akan dimasukkan ke dalam parameter data
}
```
```dart
void main() {

    cekTipe<String>('satu');
    cekTipe<int>(1);

    //outputnya akan String dan int
}
```
