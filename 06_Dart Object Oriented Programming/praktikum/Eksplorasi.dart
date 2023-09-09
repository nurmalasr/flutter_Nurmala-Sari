/* Sebuah toko buku ingin mengembangkan sebuah sistem untuk mengelola data buku. 
Data buku tersebut terdiri dari ID, judul, penerbit, harga dan kategori. 
Sistem tersebut dapat menambahkan, mendapatkan semua data buku dan menghapus data buku. 
Buatlah program berdasarkan skenario tersebut. */

class Book {
  int id;
  String title;
  String publisher;
  double price;
  String category;

  Book(this.id, this.title, this.publisher, this.price, this.category);
}

class Bookstore {
  List<Book> books = [];
  int _nextId = 1;

  // Menambahkan buku baru
  void addBook(String title, String publisher, double price, String category) {
    Book newBook = Book(_nextId, title, publisher, price, category);
    books.add(newBook);
    _nextId++;
  }

  // Mendapatkan semua data buku
  List<Book> getAllBooks() {
    return books;
  }

  // Menghapus buku berdasarkan ID
  void deleteBook(int id) {
    books.removeWhere((book) => book.id == id);
  }
}

void main() {
  Bookstore bookstore = Bookstore();

  // Menambahkan beberapa buku ke toko buku
  bookstore.addBook('Biru Laut', 'Gramedia', 30000, 'Fantasy');
  bookstore.addBook('Pemrograman Bahasa C', 'Rinaldi Munir', 120000, 'Technology');
  bookstore.addBook('Filosofi Teras', 'Gramedia', 80000, 'Philosophy');

  // Mendapatkan semua data buku
  List<Book> allBooks = bookstore.getAllBooks();

  print("Daftar Buku:");
  for (var book in allBooks) {
    print('ID: ${book.id}');
    print('Judul: ${book.title}');
    print('Penerbit: ${book.publisher}');
    print('Harga: \$${book.price.toStringAsFixed(2)}');
    print('Kategori: ${book.category}');
    print('');
  }

  // Menghapus buku dengan ID 2
  bookstore.deleteBook(2);

  // Mendapatkan semua data buku setelah penghapusan
  List<Book> updatedBooks = bookstore.getAllBooks();

  print("Daftar Buku Setelah Penghapusan:");
  for (var book in updatedBooks) {
    print('ID: ${book.id}');
    print('Judul: ${book.title}');
    print('Penerbit: ${book.publisher}');
    print('Harga: \$${book.price.toStringAsFixed(2)}');
    print('Kategori: ${book.category}');
    print('');
  }
}
