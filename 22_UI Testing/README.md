# Resume UI Testing

Pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan dapat menerima interaksi dan memberi respon kepada pengguna.

Pada Flutter, UI Testing disebut juga widget testing sehingga pengujian dilakukan pada widgets dengan menuliskan script yang dapat dijalankan secara otomatis.

**Keuntungan UI Testing :**
1. Memastikan seluruh widget memberi tampilan yang sesuai
2. Memastikan seluruh interaksi dapat diterima dengan baik
3. Menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget

- Penulisan script testing selalu diikuti _test.dart dan dilakukan pada folder **test**
- Tiap file berisi fungsi main() yang didalamnya dituliskan script testing
- Tiap skenarion pengujian disebut *test case*

## Script Testing
1. Test case diawali dengan `testWidgets` dan diberi judul
2. Simulasi proses mengaktifkan halaman AboutScreen
3. Memeriksa apakah di halaman tersebut terdapat teks "About Screen"

## Menjalankan Testing
1. Perintah flutter test akan menjalankan seluruh file test yang dibuat 
2. Hasil dari perintah adalah lama waktu pengujian, total pengujian yang dilakukan dan pesan bahwa pengujian berhasil