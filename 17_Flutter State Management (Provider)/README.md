# Resume Flutter State Management (Provider)

State, yaitu yang hanya dimiliki oleh StatefulWidget, Data yang dapat dibaca saat pembuatan widget, dan dapat berubah saat widget sedang aktif. Manfaat dari State yaitu:

- Dapat dibuat sebagai property dan digunakan pada widget saat di build.
- Untuk mengubah State dengan menggunakan setState.
  Global State, yaitu state biasa yang dapat digunakan pada seluruh widget.
  Pada Provider ada berbentuk State Management dan ada yang perlu di-install agar dapat digunakan.
  Cara Instalasi Provider:
- Menambahkan package provider pada bagian dependencies dalam file pubspec.yaml dan dijalankan dengan perintah flutter pub get.
  Pembuatan State provider:
- Buat file bernama contact.dart dan definisikan state dalam bentuk class.
- Import dalam file main.dart dan daftarkan pada runApp dengan MultiProvider.
- Simpan provider dalam variable.
- Ambil data provider melalui getter.