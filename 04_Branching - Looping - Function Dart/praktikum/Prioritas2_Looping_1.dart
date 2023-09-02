// 1. Buatlah sebuah piramid bintang seperti gambar dibawah ini

 void main() {

  int tinggiPiramid = 8;

  for (int i = 1; i <= tinggiPiramid; i++) {
    print('  ' * (tinggiPiramid - i) + ' *' * (2 * i - 1));
  }
 }