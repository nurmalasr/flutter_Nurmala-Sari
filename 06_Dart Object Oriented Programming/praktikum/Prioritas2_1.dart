/* 1. Buatlah sebuah class Calculator dengan kriteria sebagai berikut:
    1. Terdapat method untuk melakukan penjumlahan dua bilangan.
    2. Terdapat method untuk melakukan pengurangan dua bilangan.
    3. Terdapat method untuk melakukan perkalian dua bilangan.
    4. Terdapat method untuk melakukan pembagian dua bilangan. */

class Kalkulator {

  double tambah(double a, double b) {
    return a + b;
  }

  double kurang(double a, double b) {
    return a - b;
  }

  double kali(double a, double b) {
    return a * b;
  }

  double bagi(double a, double b) {
    return a / b;
  }
}

void main() {
  Kalkulator Kalkulasi = Kalkulator();

  double hasilPenjumlahan = Kalkulasi.tambah(39, 64);
  double hasilPengurangan = Kalkulasi.kurang(45, 9);
  double hasilPerkalian = Kalkulasi.kali(5, 9);
  double hasilPembagian = Kalkulasi.bagi(12, 6);

  print('Hasil Penjumlahan adalah $hasilPenjumlahan');
  print('Hasil Pengurangan adalah $hasilPengurangan');
  print('Hasil Perkalian adalah $hasilPerkalian');
  print('Hasil Pembagian adalah $hasilPembagian');
}

