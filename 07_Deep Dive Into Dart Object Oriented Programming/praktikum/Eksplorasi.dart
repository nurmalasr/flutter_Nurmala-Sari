/* Buatlah sebuah program berdasarkan class diagram berikut:
Kriteria dari program yang dibuat adalah sebagai berikut:

- Buat class beserta interface sesuai dengan class diagram diatas.
- Method `getArea()` digunakan untuk menghitung luas bangun datar.
- Method `getPerimeter()` digunakan untuk menghitung keliling bangun datar.
- Output yang harus ditampilkan adalah luas dan keliling untuk tiga bangun datar berdasarkan di class diagram. */

abstract class Shape {
  int getArea();
  int getPerimeter();
}

class Circle implements Shape {
  int radius;

  Circle(this.radius);

  @override
  int getArea() {
    return (3.14 * radius * radius).toInt();
  }

  @override
  int getPerimeter() {
    return (2 * 3.14 * radius).toInt();
  }
}

class Square implements Shape {
  int side;

  Square(this.side);

  @override
  int getArea() {
    return (side * side);
  }

  @override
  int getPerimeter() {
    return (4 * side);
  }
}

class Rectangle implements Shape {
  int width;
  int height;

  Rectangle(this.width, this.height);

  @override
  int getArea() {
    return (width * height);
  }

  @override
  int getPerimeter() {
    return (2 * (width + height));
  }
}

void main() {
  Circle circle = Circle(7);
  Square square = Square(12);
  Rectangle rectangle = Rectangle(5, 9);

  print('Luas dan Keliling Lingkaran adalah');
  print('Luas : ${circle.getArea()}, Keliling : ${circle.getPerimeter()}');

  print('Luas dan Keliling Persegi adalah');
  print('Luas : ${square.getArea()}, Keliling : ${square.getPerimeter()}');

  print('Luas dan Keliling Persegi Panjang adalah');
  print('Luas : ${rectangle.getArea()}, Keliling : ${rectangle.getPerimeter()}');
}

