/* 3. Buatlah sebuah program untuk melakukan perhitungan bilangan faktorial secara asinkron
      Input : 5 
      Output : 120 */

Future<int> faktorial (int bilangan) async {
  if (bilangan == 0 || bilangan == 1) {
    return 1;
  } else {
    int hasil = 1;
    for (int i = 2; i <= bilangan; i++) {
      hasil *= i;
    }
    return hasil;
  }
}

void main() async {
  int input = 5;

  int hasil = await faktorial(input);

  print('Faktorial dari $input adalah $hasil');
}