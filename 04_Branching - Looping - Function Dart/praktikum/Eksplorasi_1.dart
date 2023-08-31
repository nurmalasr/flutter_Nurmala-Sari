// 1. Buatlah sebuah program untuk mengecek apakah sebuah bilangan termasuk bilangan prima atau bukan
// Sampel Input 23 dan 12

void main() {

  int input = 23;
  int input2 = 12;

// mengecek kondisi dengan memanggil fungsi isPrima dan parameter input bilangan 23 untuk mengecek apakah 23 prima/bukan
  if (isPrime(input)) { 
    print('$input adalah bilangan prima');
  } else {
    print('$input bukan bilangan prima');
  }

// mengecek apakah bilangan 12 bilangan prima atau bukan
  if (isPrime(input2)) {
    print('$input2 adalah bilangan prima');
  } else {
    print('$input2 bukan bilangan prima');
  }
}

// pengecekan kondisi logika dengan fungsi
bool isPrime (int bilangan) {
  if (bilangan <= 1) { // setiap bilangan yang kurang atau sama dengan 1 bukan bilangan prima menampilkan nilai false
    return false;
  }
  for (int i = 2; i * i <= bilangan; i++) {
    if (bilangan % i == 0) { // setiap bilangan yang habis dibagi bukan bilangan prima menampilkan nilai false
      return false;
    }
  }
  return true; // selain 2 syarat diatas adalah bilangan prima, yaitu tidak bisa dibagi atau bisa dibagi namun dgn angka itu sendiri adalah true
}