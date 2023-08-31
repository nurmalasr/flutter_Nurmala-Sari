// 1. Buatlah sebuah function dengan parameter untuk menghitung luas lingkaran. kemudian function lingkaran tersebut dijalankan pada function main!

double luasLingkaran(r) {
  return 3.14 * r * r;
}
void main() {

  double luas = luasLingkaran(9.0);
  print('Luas lingkaran adalah $luas cm');
}