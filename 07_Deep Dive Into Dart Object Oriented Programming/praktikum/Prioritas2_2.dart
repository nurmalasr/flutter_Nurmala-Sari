/* 2. Dari rangkaian diatas,  lengkapi kode berikut sehingga dapat menampilkan hasil pada Layar!

void main() {
  lengkapi di sini
  print(operation.hasil());
} */

class Matematika {
  int hasil() {
    return 0;
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x;
  int y;

  KelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  int hasil() {
    return (x * y) ~/ faktorPersekutuanTerbesar(x, y);
  }

  int faktorPersekutuanTerbesar(int a, int b) {
    while (b != 0) {
      int t = b;
      b = a % b;
      a = t;
    }
    return a;
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x;
  int y;

  FaktorPersekutuanTerbesar(this.x, this.y);

  @override
  int hasil() {
    return faktorPersekutuanTerbesar(x, y);
  }

  int faktorPersekutuanTerbesar(int a, int b) {
    while (b != 0) {
      int t = b;
      b = a % b;
      a = t;
    }
    return a;
  }
}

void main() {
  KelipatanPersekutuanTerkecil kpt = KelipatanPersekutuanTerkecil(12, 18);
  FaktorPersekutuanTerbesar fpt = FaktorPersekutuanTerbesar(36, 48);

  print('${kpt.hasil()}');
  print('${fpt.hasil()}');
}
