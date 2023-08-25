/* 2. Buatlah sebuah program untuk mencari faktor dari sebuah bilangan yang dimasukkan.
  Sampel Input : 24
  Sampel Output : 1, 2, 3, 4, 6, 8, 12 */

void main(){
  int bilangan = 24;

  print('Faktor dari bilangan $bilangan adalah : ');

// melakukan iterasi setiap penambahan dan jika sudah memenuhi syarat, maka iterasi faktor dihentikan
  for (int i = 1; i < bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
  }
}

