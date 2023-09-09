/* 2. Dari rangkaian Class diatas, buatlah method Overriding untuk membedakan tiap proses dalam 
method antar Class! sehingga dapat melengkapi pengguaan code dibawah ini :

void main() {
  lengkapi di sini
  print(bangun.volume());
} */


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

  @override
  double volume() {
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang {
  Balok(double panjang, double lebar, double tinggi) : super(panjang, lebar, tinggi);

  @override
  double volume() {
    return panjang * lebar * tinggi;
  }
}

void main() {
  Kubus kubus = Kubus(5.0);
  Balok balok = Balok(4.0, 3.0, 2.0);

  BangunRuang bangun1 = kubus;
  BangunRuang bangun2 = balok;

  print('Volume Kubus adalah ${bangun1.volume()}');
  print('Volume Balok adalah ${bangun2.volume()}');
}
