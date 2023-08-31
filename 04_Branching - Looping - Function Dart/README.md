# Resume Branching - Looping - Function

1. Pengambilan keputusan (Percabangan) : menentukan alur program pada kondisi tertntu

## IF 
- Memerlukan nilai bool (operator logical/comparison)
- Menjalankan bagian proses jika nilai bool bernilai **true**

```if (nilai_bool) {
    // proses jika nilai_bool adalah true
}
```
```dart
void main() {

    var usia = 18;
    if (usia < 20) {
        print('Remaja');
    }
}
```

## IF-ELSE
- Berjalan dengan IF
- Menambahkan alternatif jika nilai_bool **false**

```
if (nilai_bool) {
    // proses jika nilai_bool true
} else {
    // proses jika nilai_bool false
}
```
```dart
void main() {

    var usia = 18;
    if (usia < 20>) {
        print('Remaja');
    } else {
        print('tidak memiliki golongan');
    }
}
```

## ELSE-IF
- Berjalan dengan IF
- Menambah alternatif jika nilai_bool false
- Menambah pengujian nilai_bool lainnya

```
if (nilai_bool) {
    // proses jika nilai_bool true
} else if (nilai_bool2) {
    // proses jika nilai_bool false
    // dan nilai_bool2 true
}
```
```dart
void main() {

    var usia = 18;
    if (usia < 20) {
        print('Remaja');
    } else if (usia < 40) {
        print('Dewasa');
    } else {
        print('Tidak memiliki golongan');
    }
}
```

2. Perulangan (Looping) : Menjalankan proses yang sama berkali-kali

## FOR
- Diketahui berapa kali perulangan terjadi
- Memerlukan nilai awal
- Memerlukan nilai bool, jika true perulangan dilanjutkan
- Memerlukan pengubah nilai (increment)

```
for (nilai_awal; nilai_bool; pengubah_nilai_awal) {
    // proses berulang jika nilai_bool true
}
```
```dart
void main() {

    for (var i = 0; i < 10; i += 1) {
        print(i);
    }
}
```

## WHILE
- Tidak diketahui berapa kali perulangan terjadi
- Memerlukan nilai bool, jika true maka perulangan dilanjutkan

```
while (nilai_bool) {
    // proses berulang jika nilai_bool true
}
```
```dart
void main() {

    var i = 0;
    while(i < 10) {
        print(i);
        i++;
    }
}
```

## DO-WHILE
- Mengubah bentuk while
- Proses dijalankan min. sekali, akan diteruskan jika nilai bool true
- Sama dengan while tapi ada pengecekan kondisi eksekusi minimum sekali, walaupun kondisi pertama false

```
do {
    // proses berulang jika nilai_bool true
} while (nilai_bool);
```
```dart
void main() {

    var i = 0;
    do {
        print(i);
        i++;
    } while(i < 10);
}
```

3. Break dan Continue untuk menghentikan perulangan. 
    - Perulangan menggunakan nilai bool untuk lanjut/berhenti
    - Break dan Continue menghentikan perulangan dengan mengabaikan nilai bool
    - Continue menghentikan satu kali proses

4. Break -> Menghentikan seluruh proses perulangan 

```dart
void main() {

    for (var i = 0; true; i++) {
        if (i == 10) {
            break; // jika i adalah 10, perulangan dihentikan
        }
        print(i)
;    }
}
```

5. Continue -> Menghentikan satu kali proses perulangan 

```dart
void main() {

    for (var i = 0; i < 10; i++) {
        if (i == 5) {
            continue; // jika i adalah 5, perulangan dilewati
        }
        print(i);
    }
}
```
6. Fungsi : kumpulan kode/perintah yang dapat digunakan berulang kali. Cukup mengubah fungsi sekali, penggunaan lainnya akan berubah

```
tipe_data nama_fungsi () {
    // perintah yang dijalankan saat fungsi dipanggil
}
```
```dart
void halo() {
    print('halo'); // outputnya ada 3 halo()

void main() {
    halo();
    halo();
    halo();
}
}
```
Memanggil Fungsi 
```dart
void main() {

    halo(); // memanggil fungsi halo di dalam fungsi main dengan format nama_fungsi ();
}
```

7. Fungsi dengan Parameter yaitu mengirim data saat menjalankan fungsi
```
tipe_data nama_fungsi(tipe_data nama_parameter) {
    // perintah yang dijalankan saat fungsi dipanggil 
}
```
```dart
void tampil(String teks) {
    print('teks');
}

void main() {

    tampil('halo'); // untuk memanggil function tampil, mengirimkan 1 parameter dengan tipe data String yaitu 'halo'
    tampil('Selamat datang');
}
```

8. Fungsi dengan Return yaitu fungsi yang mengembalikan nilai, memberi nilai pada fungsi saat dipanggil. **Void tidak dapat mengembalikan nilai**

```
tipe_data nama_fungsi (tipe_data nama_parameter) {
    // perintah yang dijalankan saat fungsi dipanggil return nilai;
}
```
```dart
int jumlah(int a, int b) {
    return a + b;
}

void main() {

    var hasil = jumlah(1,2);
    print(hasil);
}
```

