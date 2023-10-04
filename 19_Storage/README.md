# Resume Storage

Penyimpanan Lokal diperlukan untuk efisiensi penggunaan data internet. Ada beberapa cara implementasi penyimpanan lokal, contohnya :
- Shared Preferences
- Local Database

## Shared Preference
- Menyimpan data yang sederhana
- Penyimpanan dengan format key-value
- Menyimpan tipe data dasar seperti teks, angka dan boolean
- Contoh penggunaan seperti menyimpan data login dan riwayat pencarian

**Implementasinya :**
1. Menambahkan shared preference pada fitur login
2. Tambahkan package `shared_preferences`
3. Buat property baru untuk `TextEditingController` dan tambahkan di setiap `TextFormField`

```dart
final _nameController = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
```

4. Buat method `dispose()` untuk menghindari kebocoran memori

```dart
@override
void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
}
```

5. Buat variabel baru `logindata` untuk menyimpan SharedPreference dan variabel `newUser`
6. Buat method baru dengan nama `checkLogin()`

```dart
late SharedPreferences logindata;
late bool newUser;
```

```dart
void checkLogin() async {
    logindata = await SharedPreferences.getInstance();
    newUser = logindata.getBool('login') ?? true;

    if (newUser == false) {
        Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
                builder: (context) => const HomePage(),
            ),
            (route) => false
        );
    }
}
```

7. Panggil method `checkLogin()` di method `initState()`

```dart
@override
void initState() { // fungsi yang pertama kali dipanggil sebelum widget tree dibangun
    super.initState();
    checkLogin();
}
```

8. Di dalam `onPressed` ElevatedButton, buat variabel baru `username` untuk menampung input dari user

```dart
ElevatedButton(
    onPressed: () {
        final isValidForm = formKey.currentState!.validate();

        String username = _nameController.text;
        if (isValidForm) {
            Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                    builder: (context) => const HomePage(),
                ),
                (route) => false
            );
        }
    },
    child: const Text('Login'),
),
```

9. Buat `setBool` dan `setString` baru didalam blok kode if

```dart
ElevatedButton(
    onPressed: () {
        final isValidForm = formKey.currentState!. validate();

        String username = _nameController.text;
        if (isValidForm) {
            logindate.setBool('login', false);
            logindate.setString('username', username);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomePage(),
                ),
                (route) => false
            );
        }
    },
    child: const Text('Login'),
)
```

10. Pada file home_page.dart tambahkan UI
11. Buat variabel baru untuk menyimpan SharedPreferences dan username (home_page.dart)
12. Buat method baru `initial()` dan panggil di method `initState()`

```dart
late SharedPreferences logindata;
String username = '';
```

```dart
@override
void initState() {
    super.initState();
    initial();
}

void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState() {
        username = logindata.getString('username').toString(); // mendapatkan value dari key username
    });
}
```

13. Mengganti text `username` menjadi variabel username
14. Tambahkan method `setBool` dan remove pada ElevatedButton

## Local Database (SQLite)
- Menyimpan dan meminta data dalam jumlah besar pada local device
- Bersifat private
- Menggunakan SQLite database melalui package *sqflite*
- SQLite adalah database open source yang mendukung insert, read, update dan remove data