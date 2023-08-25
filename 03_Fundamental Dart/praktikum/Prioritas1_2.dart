// 2. Implementasikan rumus keliling dan luas dari Lingkaran dengan menggunakan Bahasa Dart

void main(){

  // membuat nilai variabel jari-jari lingkaran 
  double jariLingkaran = 17.0;
  
  // memanggil fungsi dengan parameter dan mencetak output 
  double keliling = kelilingLingkaran(jariLingkaran);
  print('Keliling lingkaran adalah $keliling cm');
  double luas = luasLingkaran(jariLingkaran);
  print('Luas lingkaran adalah $luas cm');
}

// fungsi untuk menghitung keliling lingkaran (rumus)
double kelilingLingkaran(double jariLingkaran) {
  return 2 * 3.14 * jariLingkaran;
}

// fungsi untuk menghitung luas lingkaran (rumus)
double luasLingkaran(double jariLingkaran) {
  return 3.14 * jariLingkaran * jariLingkaran;
}