import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Course {
  final String name;

  Course({
    required this.name,
  });
}

class MyApp extends StatelessWidget {
  final List<Course> courses = [
    Course(
      name: 'Pemrograman Mobile',
    ),
    Course(
      name: 'Basis Data',
    ),
    Course(
      name: 'Jaringan Komputer',
    ),
    Course(
      name: 'Sistem Operasi',
    ),
    Course(
      name: 'Pemrograman Web',
    ),
    Course(
      name: 'Pemrograman Web 2',
    ),
    Course(
      name: 'Pemrograman Web 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF6200EE),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6200EE),
          title: Center(
            child: Text('Daftar Mata Kuliah'),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
              },
            ),
          ],
        ),
        body: ListView.separated(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return ListTile(
              title: Text(course.name),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Informasi Mata Kuliah'),
                      content: Text(
                        'Nama Mata Kuliah: ${course.name}',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
floatingActionButton: FloatingActionButton(
          onPressed: () {
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFF03DAC5),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF6200EE),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Information',
            ),
          ],
        ),
      ),
    );
  }
}









