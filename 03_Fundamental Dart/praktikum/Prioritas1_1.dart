// 1. Buatlah rumus keliling dan luas persegi dan persegi panjang dengan menggunakan bahasa pemrograman Dart

void main() {

  // menentukan nilai variabel sisi persegi
  double sisi = 6.0;

  // menentukan nilai variabel panjang & lebar persegi panjang
  double panjang = 4.0;
  double lebar = 12.0;

  double keliling = kelilingPersegi(sisi);
  print('Keliling persegi adalah $keliling cm');
  double luas = luasPersegi(sisi);
  print('Luas persegi adalah $luas cm');

  double keliling2 = kelPersegiPjg(panjang,lebar);
  print('Keliling persegi panjang adalah $keliling2 cm'); 
  double luas2 = luasPersegiPjg(panjang, lebar);
  print('Luas persegi panjang $luas2 cm');
}

double kelilingPersegi(double sisi) { 
  return 4 * sisi;
}
double luasPersegi (double sisi) {
  return sisi * sisi;
}
double kelPersegiPjg(double panjang, lebar) {
  return panjang * lebar;
}
double luasPersegiPjg(double panjang, lebar) {
  return 2 * panjang + 2 * lebar;
}