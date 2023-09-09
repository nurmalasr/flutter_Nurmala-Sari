/* 2. Buatlah sebuah class Course dan Student dengan kriteria sebagai berikut:
    1. Atribut dari Course terdiri dari judul dan deskripsi.
    2. Atribut dari Student terdiri dari nama, kelas dan daftar course yang dimiliki.
    3. Student dapat menambahkan course.
    4. Student dapat menghapus course.
    5. Student dapat melihat semua course yang telah ditambahkan. */

class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> courses = [];

  Student(this.nama, this.kelas);

  // Student dapat menambahkan course
void tambahCourse(Course matkul) {
  courses.add(matkul);
}

// Student dapat menghapus course
void hapusCourse(Course matkul) {
  courses.remove(matkul);
}

// Student melihat semua data course yang ditambahkan
void lihatCourse() {
  if (courses.isEmpty) {
    print('$nama belum memiliki course');
  } else {
    print('$nama memiliki ${courses.length} course :');
    for (var matkul in courses) {
      print('- ${matkul.judul}: ${matkul.deskripsi}');
    }
  }
}
}

void main() {
  // Membuat object Course
  var course1 = Course('Flutter Widget', 'Fundamental OOP');
  var course2 = Course('Deep Dive OOP', 'Platform Widget');

  // Membuat object Student
  var students = Student('Nurmala Sari', 'Flutter D');

  // Menambahkan Course ke daftar course students
  students.tambahCourse(course1);
  students.tambahCourse(course2);

  // Untuk melihat semua course yang ada di daftar
  students.lihatCourse();

  // Menghapus course dari daftar course
  students.hapusCourse(course2);

  // Melihat kembali daftar course setelah dihapus
  students.lihatCourse();
  }



