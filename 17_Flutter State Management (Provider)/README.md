# Resume Flutter State Management (Provider)

- Data yang dapat dibaca saat pembuatan widget
- Dapat berubah saat widget sedang aktif
- Hanya dimiliki oleh **Stateful Widget**

Memanfaatkan State ketika membuat widget yang ingin ada perubahan.
- Menyimpan nilai di sebuah property dari class
- Ketika ada perubahan, state dapat digunakan pada widget saat di build ulang

## Mengubah State
Menggunakan method **setState**

```dart
ElevatedButton(
    child: const Text('Tambah'),
    onPressed: () {
        setState(() {
            number = number + 1; // number++
        });
    },
);
```

## Global State
- State biasa yang dapat digunakan pada seluruh aplikasi dan widget 

Perlu Global State agar antara widget dapat memanfaatkan state yang sama dengan mudah. Contohnya fitur keranjang pada e-commerce dimana membutuhkan state dari Cart di halaman pembayaran & deskripsi produk.

### Instalasi Provider
- Menambahkan package provider pada bagian dependencies dalam file `pubspec.yaml`
- Jalankan perintah `flutter pub get`

### Membuat State Provider
- Definisikan state dalam bentuk class

```dart
import 'package:flutter/material.dart';

class Contact with ChangeNotifier { // ChangeNotifier mengelola status dan notifikasi perubahan ke widget yang terhubung
    List<Map<String, String>> _contacts = []; // variabel anggota kelas yang menyimpan daftar kontak. Setiap kontak direpresentasikan oleh sebuah 'Map'

    List<Map<String, String>> get contacts => _contacts; // Mendapatkan daftar kontak

    void add(Map<String, String> contact) {
        _contacts.add(contact);
        notifyListeners();
    }
}
```

- Import dalam file main.dart
- Daftarkan dalam `runApp` dengan `MultiProvider`

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:phonebookapp/stores/contact.dart' as contact_Store; // alias, digunakan untuk memberikan nama alias pada modul agar mudah digunakan dalam kode

void main() {
    runApp(
        MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (_) => contact_store.Contact()) // memberikan object Contact() kedalam widget-tree
            ],
            child: MyWidget(), // widget utama yang akan ditampilkan dalam aplikasi. contoh, menambahkan placeholder 'MyWidget' yg seharusnya digantikan dgn widget sesungguhnya yg akan digunakan dalam aplikasi 
        ),
    );
}
```

- Simpan provider dalam variable
- Ambil data dari provider melalui getter

```dart
// build
final contactProvider = Provider.of<contact_store.Contact>(context); // Provider.of mendapatkan instance dari provider 'Contact' dari widget-tree

// di dalam diamond, menyatakan tipe objek yang diinginkan dari provider, kita ingin mendapatkan instance dari class 'Contact' yg didefinisikan di dalam 'contact_store'

// return
ListView.builder(
    itemCount: contactProvider.contacts.length, // menentukan jumlah item dalam daftar, diambil dari panjang daftar kontak yg diberikan
    itemBuilder: (context, index) { // memanggil setiap item dalam daftar
        return ListTitle(
            title: Text(contactProvider.contacts[index]['name'] ?? ''), // menggunakan string kosong jika 'name' tidak ada
            subtitle: Text(contactProvider.contacts[index]['phone'] ?? ''),
        );
    },
);
```

Menambahkan Provider ke dependencies : CTRL + SHIFT + P > Dart: Add Dependency > Provider