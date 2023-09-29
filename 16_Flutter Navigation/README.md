# Resume Flutter Navigation

Navigation adalah bagaimana pengguna dapat berpindah dari halaman satu ke halaman lain. 

- Perpindahan halaman menggunakan `Navigator.push()` (Go)
- Kembali ke halaman sebelumnya menggunakan `Navigator.pop()` (Back)

```dart
class HomeScreen extends StatelessWidget {
    const HomeScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Home Screen'),
            ),
            body: Center(
                child: ElevatedButton(
                    child: const Text('Go To About Page'),
                    onPressed: () {

                        //saat tombol ditekan
                        // pindah ke halaman AboutScreen
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const AboutScreen()),
                        );
                    },
                ),
            ),
            );
    }
}
```

```dart
class AboutScreen extends StatelessWidget {
    const AboutScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('About Screen'),
            ),
        );
    }
}
```

### Mengirim Data ke Halaman Baru
- Menggunakan parameter pada constructor halaman

### Navigation dengan Named Routes
- Setiap halaman memiliki alamat yang disebut **route**, dapat menggunakan halaman tersebut untuk melakukan perpindahan alamat
- Perpindahan halaman menggunakan `Navigator.pushNamed()` (Go)
- Kembali ke halaman sebelumnya menggunakan `Navigator.pop()` (Back)

### Mendaftarkan Route
- Tambahkan `initialRoute` dan `routes` pada MaterialApp
- Tiap route adalah fungsi yang membentuk halaman

### Perpindahan Halaman
```dart
ElevatedButton(
    child: const Text('Go To About Page'),
    onPressed: () {

        // saat tombol di tekan
        // pindah ke halaman dengan nama /about
        Navigator.of(context).pushNamed('/about');
    },
);
```

### Mengirim Data ke Halaman Baru
- Menggunakan arguments saat melakukan pushNamed
