class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student(this.nama, this.kelas);

  void tambahCourse(Course course) {
    daftarCourse.add(course);
  }

  void hapusCourse(Course course) {
    daftarCourse.remove(course);
  }

  void lihatCourse() {
    if (daftarCourse.isEmpty) {
      print('Belum ada course yang ditambahkan');
    } else {
      print('Daftar course yang telah ditambahkan:');
      for (int i = 0; i < daftarCourse.length; i++) {
        Course course = daftarCourse[i];
        print('${i + 1}. ${course.judul} - ${course.deskripsi}');
      }
    }
  }

  @override
  String toString() {
    String courses = "";
    if (daftarCourse.isNotEmpty) {
      courses = "\nCourses: \n";
      for (int i = 0; i < daftarCourse.length; i++) {
        Course course = daftarCourse[i];
        courses += "${i + 1}. ${course.judul} - ${course.deskripsi}\n";
      }
    }
    return "Name: $nama\nClass: $kelas$courses";
  }
}

void main() {
  Course course1 = Course(
      'Pemrograman Dasar', 'Materi dasar pemrograman menggunakan bahasa Dart');
  Course course2 = Course('Pemrograman Lanjutan',
      'Materi lanjutan pemrograman menggunakan bahasa Dart');
  Course course3 = Course('Mobile Development',
      'Materi pengembangan aplikasi mobile menggunakan Flutter');

  Student student1 = Student('Iyan', 'Flutter B');
  print(student1);

  student1.tambahCourse(course1);
  student1.tambahCourse(course2);
  student1.tambahCourse(course3);

  student1.lihatCourse();

  student1.hapusCourse(course2);

  student1.lihatCourse();
}
