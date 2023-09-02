// Buatlah sebuah jam pasir seperti pada gambar dibawah ini

void main() {

  int tinggiJam = 6;

  for (int i = 1; i <= tinggiJam; i++) {
    print(' ' * (i - 1) + '0' * (2 * (tinggiJam - i) + 1));
  }

  for (int i = tinggiJam - 1; i >= 1; i--) {
    print(' ' * (i - 1) + '0' * (2 * (tinggiJam - i) + 1));
  }
}