/* 3. Tampilkan faktorial nilai dibawah ini :
      a. 10
      b. 40 
      c. 50 */

void main() {

  int nilai1 = hitungFaktorial(10);
  int nilai2 = hitungFaktorial(40);
  int nilai3 = hitungFaktorial(50);

  print('Faktorial dari 10 adalah $nilai1');
  print('Faktorial dari 40 adalah $nilai2');
  print('Faktorial dari 50 adalah $nilai3');
}

int hitungFaktorial (int bilangan) {
  if (bilangan == 0 || bilangan == 1) {
    return 1; // 0! = 1 dan 1! = 1
  } else {
    int faktorial = 1;
    for (int i = 2; i <= bilangan; i++) {
      faktorial *= i;
    }
    return faktorial;
  }
}