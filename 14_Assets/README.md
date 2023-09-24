# Resume Assets 

## Assets 
- File yang di bundled dan di deployed bersamaan dengan aplikasi

Tipe-tipe assets berupa :
1. Static Data (JSON files)
2. Icons
3. Images
4. Font file (ttf)

**Menentukan Assets**
- Flutter menggunakan pubspec.yaml
- Pubspec.yaml terletak pada root project untuk mengidentifikasi assets yang dibutuhkan aplikasi
- Gunakan karakter "/" untuk memasukkan semua assets dibawah satu *directory name* 

assets:
    - assets/my_icon.png
    - assets/background.jpg

assets:
    - assets/

### IMAGES
- Membuat tampilan lebih menarik
- Mendukung format JPEG, WebP, GIF, Animaed Web/GIF, PNG, BMP dan WBMP
- Menampilkan gambar dari project asset dan internet

**Loading Images :**
- Gunakan widget Image
- Membutuhkan property `image` dengan `class AssetImage()`
- Menambahkan image ke folder assets (lebih CPU friendly & cepat)

```dart
body: Column(
    children: const [
        Image(
            image: AssetImage('assets/background.jpg'),
        ),
        Image(
            image: AssetImage('assets/my_icon.png'),
        ),
    ]
)
```

- Menggunakan method `Image.asset`, mendapatkan image yang sudah ditambahkan dalam project 
- Menggunakan method `Image.network`, mendapatkan data image melalui internet dengan menggunakan string URLnya

```dart
body: Column(
    children: [
        Image.asset('assets/background.jpg'),
        Image.network('https://picsum.photos/id/1/200/300'),
    ],
)
```

### FONT
- Penentuan oleh UI Designer
- Keunikan pada apk
- Penerapan font menggunakan custom font atau dari package

**Custom Font** 
1. Download font (ex. https://fonts.google.com/)
2. Donwload family
3. Import file .ttf di folder 
4. Daftarkan font di pubspec.yaml
5. Mengatur font sebagai default

```dart
Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Assets',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Rowdies'),
        home: const HomePage()
    )
}
```

6. Gunakan font di spesifik widget 

```dart
Text(
    'Star Hill',
    style: TextStyle(
        fontSize: 30,
        fontFamily: 'Rowdies',
    ),
),
```

**Font dari Package**
1. Tambahkan package google_fonts di dependencies
2. Import package di file dart
3. Gunakan font dengan memanggil `GoogleFonts.namaFont()`

```dart
Text(
    'Star Hill',
    style: GoogleFonts.rowdies(fontSize: 30),
),
```

## Implementasi pada Task Management

```dart
return Container(
    alignment: Alignment.center,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
            Image(
                image: AssetImage(
                    'asset/empty_background.png',
                ),
                height: 250,
            ),
        ],
    ),
);
```

Menambahkan Image untuk membuat profile picture menggunakan widget `CircleAvatar`

```dart
CircleAvatar(
    radius: 50,
    backgroundImage: AssetImage('assets/profile_pic.png'),
),
```

Menambahkan font pada setiap text (tambahin ke dependecies dulu)

```dart
Text(
    'Andre',
    style: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
    ),
),
```

Menambahkan konten lain

```dart
SizedBox(
    child: Column(
        children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                        'Task Completed',
                        style: GoogleFonts.poppins(fontSize: 17),
                    ),
                    const Icon(
                        Icons.chevron_right_rounded,
                        size: 30,
                    )
                ],
            ),
            const SizedBox( // SizedBox ....
                Row( // Row....
            Const SizedBox(
                Row(
            Const SizedBox(
            ElevatedButton(
                onPressed: () {},
                child: Text(
                    'Log Out',
                    style: GoogleFonts.poppins(fontSize: 17),
                ),
            ),
            ),
            ),
        ],
    ),
)
```

Menambahkan konten text dibawah image empty screen

```dart
Text(
    'task masih kosong...',
    style: GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.w500,
    ),
)
```

Full Source Code : (https://bit.ly/3sgGr9O)