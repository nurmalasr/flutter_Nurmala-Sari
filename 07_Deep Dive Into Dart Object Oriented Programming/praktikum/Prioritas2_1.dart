/* 1. Buatlah Class dengan spesifikasi berikut :

- Class Matematika ada method hasil()
- Class KPT ada Property x & y
- Class FPT ada Property x & y */

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
