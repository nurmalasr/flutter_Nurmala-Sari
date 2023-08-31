// 2. Buatlah sebuah program untuk mencetak tabel perkalian dengan input 9

import 'dart:io';

void main() {
  int input = 9; // input bilangan untuk tabel perkalian

  // membuat tabel perkalian
  for (int i = 1; i <= input; i++) {
    for (int j = 1; j <= input; j++) {
      int bilangan = i * j; // untuk menghasilkan nilai perkalian yang dicetak pada tabel
      String formatBilangan = bilangan.toString().padLeft(2, ' '); 
      stdout.write(formatBilangan + ' '); // menampilkan tanpa pemindahan baris dan mencetak bilangan dengan spasi sebagai pemisah
    }
    print(""); // pindah ke baris berikutnya setelah selesai satu baris
  }
}

