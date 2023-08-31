// 1. Buatlah sebuah piramid bintang seperti gambar dibawah ini

 void main() {
  
    int tinggi = 16;

    for (int i = 1; i <= tinggi; i += 2) {
      String bintang = '*' * i; // Membuat string bintang dengan jumlah bintang yang sesuai
      String spasiKiri = ' ' * ((tinggi - i) ~/ 2); // Spasi di sebelah kiri
      String spasiKanan = ' ' * ((tinggi - i) ~/ 2); // Spasi di sebelah kanan
      print('$spasiKiri$bintang$spasiKanan');
    }
  }