/* 2. Buatlah sebuah program untuk menghitung rata-rata dari sekumpulan nilai. Lakukan pembulatan keatas untuk nilai hasil perhitungan rata-rata
      Input : [7,5,3,5,2,1]
      Output : 4 */

void main() {
  List<int> nilai = [7, 5, 3, 5, 2, 1];

  int jumlah = 0;
  for (int bilangan in nilai) {
    jumlah += bilangan;
  }

  double rataRata = jumlah / nilai.length;

  // pembulatan keatas nilai hasil perhitungan
  int pembulatan = (rataRata + 0.5). toInt();

  print('Rata-rata nilai adalah $pembulatan');
} 