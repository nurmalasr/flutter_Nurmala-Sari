// 2. Selanjutnya pada class Mobil, tambahkan method totalMuatan untuk menghitung total muatan yang diangkut oleh mobil tersebut!

class Hewan {
  double beratSapi = 600;
  double beratKambing = 600;
}

class Mobil {
  double kapasitas;
  List<double> muatan = [];

  Mobil(this.kapasitas);

  void tambahMuatan(double beratMuatan) {
    if (totalMuatan() + beratMuatan <= kapasitas) {
      muatan.add(beratMuatan);
      print('Hewan dengan berat $beratMuatan kg telah ditambahkan ke dalam muatan');
    } else {
      print('Kapasitas muatan tidak mencukupi untuk hewan dengan berat $beratMuatan kg');
    }
  }

  double totalMuatan() {
    return muatan.isNotEmpty ? muatan.reduce((a, b) => a + b) : 0;
  }
}

void main() {
  Mobil pickup = Mobil(1000);

  Hewan hewan = Hewan();
  
  pickup.tambahMuatan(hewan.beratSapi); 
  pickup.tambahMuatan(hewan.beratKambing); 

  print('Total kapasitas muatan saat ini adalah ${pickup.totalMuatan()} kg');
}
