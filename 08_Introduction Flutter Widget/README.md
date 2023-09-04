# Resume Introduction Flutter Widget 

1. Flutter adalah alat pengembangan antarmuka (framework) dari Google yang digunakan untuk membuat aplikasi mobile, desktop dan web. Dengan beberapa keunggulan berupa :
    - mudah digunakan dan dipelajari
    - produktivitas tinggi
    - dokumentasi lengkap
    - komunitas yang berkembang

2. Bagian dari Flutter terdiri dari **SDK (Software Development Kit)**, dimana SDK alat-alat untuk membantu proses pengembangan aplikasi dan didalam SDK termasuk **Framework**, adalah perlengkapan untuk membentuk aplikasi yang dapat dikustomisasi agar dapat multiplatform dengan single command base

3. Membuat project Flutter dilakukan dengan perintah :

`flutter create <nama_project>`

4. Untuk menjalankan Project, pastikan sudah masuk ke direktori project lalu lakukan perintah :

`flutter run`

5. Stuktur Direktori default akan ditampilkan

**Direktori Platform**
- android
- ios
- web

**Direktori project**
- **lib**, ruang kerja utama
- **test**, aktivitas pengujian

6. File utama berupa main.dart di dalam direktori **lib**, file ini pertama kali dibaca dan dijalankan 

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // Fungsi runApp untuk memberitahukan ke Flutter bahwa top level widget dari aplikasi. MyApp untuk menjalankan aplikasi dengan fungsi runApp
```

7. Widget : sebagian aplikasi Flutter terbentuk dari widget-widget
- Digunakan untuk membentuk antarmuka (UI)
- Berupa `class`
- Dapat terdiri dari beberapa widget lainnya

8. Jenis pada widget ada **Stateless** dan **Stateful**

### Stateless Widget
- Hanya sekali di build 
- Tidak bergantung pada perubahan data
- Hanya fokus pada tampilan
- Dibuat dengan `extends` pada class `StatelessWidget`

```dart
class MyWidget extends StatelessWidget {
    const MyWidget({Key? key}) : super(key: key); // memberikan parameter

    @override 
    Widget build(BuildContext context) {
        return const MaterialApp(
            home: Scaffold(
                body: Text('Selamat datang di Flutter!');
            )
        )
    }
}
```

### Stateful Widget
- Mementingkan pada perubahan data
- Dibuat dengan `extends` pada class `StatefulWidget`
- 1 widget menggunakan 2 class (widget dan state) 

```dart
class MyWidget extends StatefulWidget {
    const MyWidget({Key? key}) : super(key: key);

    @override 
    createState() => MyWidgetState(); // perbedaan stateless dgn stateful disini, dimana harus override  
}
```
```dart
class MyWidgetState extends State<MyWidget> {
    @override
    Widget build(BuildContext context) {
        return const MaterialApp(
            home: Scaffold(
                body: Text('Selamat datang di Flutter!'),
            ),
        );
    }
}
```

9. Built in Widget
- Widget yang dapat langsung digunakan
- Sudah ter-install bersama Flutter
Contohnya MaterialApp, home, Scaffold, appBar, dsb bisa dicek melalui [(https://api.flutter.dev/flutter/material/material-library.html)]

### MaterialApp (Default Root)
Membangun aplikasi dengan desain material (design system) untuk pengembangan aplikasi Android.
`const MaterialApp();`
```dart
const MaterialApp(
    home: Text('Selamat datang di Flutter.');
)
```

### Scaffold
Membentuk sebuah halaman, dimana dapat menggunakan property appBar, body, drawer, dsb
`const Scaffold();`
```dart
const Scaffold(
    body: Text('Selamat datang di Flutter'),
);
```

### AppBar
Membentuk aplikasi bar yang terletak pada bagian atas halaman (navbar)
`AppBar();`
```dart
AppBar(
    title: const Text('Home'); // title merupakan salah satu property di AppBar
);
```

### Text
Menampilkan sebuah String teks
`const Text(teks);`
```dart
const Text('haloo...');
```

Jika menampilkan keseluruhan hasil komponen diatas, maka codenya sebagai berikut :

```dart
@override
Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: const Text('Home'),
            ),
            body: const Text('Selamat datang di Flutter!'),
        ),
    );
}
```
