# Resume Installation Command Line Interface and Package Management in Flutter

1. Flutter CLI (Command Line Interface) adalah alat yang digunakan untuk berinteraksi dengan Flutter SDK, perintah dijalankan dalam terminal.

## Important CLI Commands 

### Flutter Doctor
Perintah untuk menampilkan informasi software yang dibutuhkan flutter. Jika software yang dibutuhkan tidak bekerja, akan memunculkan warning 

### Flutter Create
Perintah untuk membuat project aplikasi flutter baru di directory tertentu

```flutter create <app_name>```

### Flutter Run
Perintah untuk menjalankan project/kode program aplikasi di device yang tersedia

```flutter run <dart_file>``` contoh ```flutter run lib/main.dart```

### Flutter Emulator
Perintah untuk menampilkan daftar emulator yang terinstall dan menampilkan option untuk membuka emulator atau membuat emulator baru 

```flutter emulators```
```flutter emulators --launch <emulator_id>```
```flutter emulators --create [--name xyz]```

### Flutter Channel 
Perintah untuk menampilkan daftar flutter channel yang tersedia dan menunjukan channel yang digunakan saat ini 

```flutter channel``` 

Untuk mengubah channel, ```flutter channel <nama_channel>```

### Flutter Pub
Dua syntax yang dapat digunakan yaitu :
- **Flutter pub add**, untuk menambahkan packages ke dependencies yang ada di pubspec.yaml

```flutter pub add <package_name>```

- **Flutter pub get**, untuk mendownload semua packages atau dependencies yang ada di pubspec.yaml 

```flutter pub get```

### Flutter Build
Perintah untuk memproduksi sebuah file aplikasi untuk keperluan deploy atau publish ke AppStore, Playstore, dsb

```flutter build <directory>```

### Flutter Clean  
Perintah untuk menghapus folder build serta file lainnya yang dihasilkan saat kita menjalankan aplikasi di emulator, perintah ini akan memperkecil ukuran project tersebut

```flutter clean```

2. Packages Management :
- Flutter mendukung sharing packages, kontribusi dari dev lain
- Packages dibuat developers lain
- Mempercepat pengembangan aplikasi karena tidak perlu membuat semuanya dari awal atau from scratch
- Mendapatkan packages di website **pub.dev**

3. Cara menambahkan Packages :
    * Cari package di pub.dev
    * Copy baris dependencies yang ada di bagian installing
    * Buka pubspec.yaml
    * Paste barisnya dibawah dependencies di pubspec.yaml 
    * Run flutter pub get di terminal
    * Import package di file dart agar bisa digunakan
    * Stop atau restart aplikasi jika dibutuhkan 