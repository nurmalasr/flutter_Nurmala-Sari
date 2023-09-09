/* 1. Buatlah Class dengan spesifikasi sesuai pada gambar dibawah ini */

class BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return panjang * lebar * tinggi;
  }
}

class Kubus extends BangunRuang {
  double sisi = 0;

  Kubus(double sisi) : super(sisi, sisi, sisi) {
    this.sisi = sisi;
  }
}

class Balok extends BangunRuang {
  Balok(double panjang, double lebar, double tinggi) : super(panjang, lebar, tinggi);
}