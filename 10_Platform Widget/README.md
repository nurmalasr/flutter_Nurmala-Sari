# Resume Platform Widget

1. **MaterialApp** adalah widget dasar yang **mengemas seluruh widget** dalam aplikasi dalam sistem Android. Di-import dari ```package:flutter/material.dart``` untuk menggunakan MaterialApp

2. Seluruh tampilan yang berupa widget-widget akan dikemas di dalam MaterialApp

3. Widget yang pertama kali dibuka, diletakkan pada bagian **home**

```dart
MaterialApp(
    theme: ThemeData.dark(), // Mengatur tema aplikasi
    home: const HomePage(), // Halaman utama
)
```

4. Mengatur halaman juga dapat dilakukan dengan menggunakan **routes** dan **initialRoute** 

```dart
MaterialApp(
    theme: ThemeData.dark(), // Mengatur tema aplikasi
    initialRoute: 'home', // Route
    routes: { 
        'home': (_) => const HomePage(), // Mendaftarkan halaman pada routes
    },
);
```

5. **Scaffold** adalah widget dasar untuk membangun sebuah halaman pada MaterialApp. MaterialApp dapat memiliki beberapa Scaffold di dalamnya. Membentuk tata letak dasar sebuah halaman yang ditulis melalui properti-properti :

```dart
Scaffold(
    appBar: AppBar(...), // Bar menu bagian atas halaman 
    drawer: Drawer(...), // Menu bagian samping halaman 
    body: ..., // Bagian utama halaman, untuk mengisi informasi pada sebuah halaman 
    bottomNavigationBar: BottomNavigationBar(...), // Bar menu bagian bawah halaman 
);
```

6. **CupertinoApp** adalah widget dasar yang mengemas seluruh widget dalam aplikasi sistem iOS, penggunaannya dengan melakukan import ```package:flutter/cupertino.dart```

- Variabel **_themeDark** dibuat untuk menyimpan tema
- Diperlukan karena Cupertino tidak menyediakan ThemeData.dark() seperti pada Material

```dart
final _themeDark = const CupertinoThemeData.raw( // Membuat dasar tema
    Brightness.dark, // Mengatur brightness tema menjadi dark 
    null, 
    null,
    null,
    null,
    null,
);
```

Berikutnya, struktur widget yang pertama kali dibuka, diletakkan pada bagian **home**

```dart
CupertinoApp(
    theme: _themeDark, // Mengatur tema aplikasi 
    home: const HomePage(), // Halaman utama
)
```

7. **CupertinoPageScaffold** adalah widget dasar untuk membangun sebuah halaman pada CupertinoApp. Struktur :

```dart
CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(...), // Bar menu bagian atas halaman 
    child: ..., // Bagian utama halaman 
);
```

8. Cupertino tidak mendukung drawer