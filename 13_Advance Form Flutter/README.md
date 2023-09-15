# Resume Advanced Form Input 

User Form Input dapat digunakan sebagai interaksi antara aplikasi dan user, widget ini bertujuan untuk mengumpulkan input dan feedback dari user.

**Basic Layout UI :**
```dart
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Interactive Widgets'),
            centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.all(16),
            child: ListView(
                children: const [
                    // build DatePicker
                    // build ColorPicker
                    // build FilePicker
                ],
            ), // ListView
        ), // Container
    ); // Scaffold
};
```

### Date Picker
- Widget agar user bisa memasukkan tanggal
- Contoh, tanggal kelahiran, waktu pemesanan tiket, waktu reservasi restoran, jadwal meeting, dll

**Membuat Date Picker :**
- Menggunakan fungsi bawaan flutter `showDatePicker`
- Fungsi `showDatePicker` memiliki tipe data future
- Menampilkan dialog material design date picker

```dart
final selectDate = await showDatePicker (
    context: context,
    initialDate: currentDate, // tanggal pertama kali ditampilkan kpd user
    firstDate: DateTime(1990), // tanggal pertama ditampilkan 1990
    lastDate: DateTime(currentDate.year + 5), 
);
```

- Menambahkan packages **intl** di pubspec.yaml
```dart
dependencies:
flutter:
    sdk: flutter
intl: ^0.17.0 // formatting tanggal
```

- Mempersiapkan variabel
```dart
class _HomePageState extends State<HomePage> {
    DateTime _dueDate = DateTime.now(); // menyimpan tanggal yg dipilih user
    final currentDate = DateTime.now(); // menyimpan tgl hari ini
}
```

- Membuat UI
```dart
Widget buildDataPicker(BuildContext context) {
    return Column(
        crossAxisAlignment: crossAxisAlignment.start,
        children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    const Text('Date'),
                    TextButton(
                        child: const Text('Select'),
                        onPressed: () {},
                    ), // TextButton
                ],
            ), // Row
            Text(DateFormat('dd-MM-yyyy')).format(_dueDate),
        ],
    ); // Column
}
```

- Menambahkan fungsi showDatePicker di dalam onPressed 
```dart
onPressed: () async {
    final selectDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1990),
        lastDate: DateTime(currentDate.year + 5),
    );
}
```

- Memanggil fungsi setState di dalam onPressed
```dart
setState(()) {
    if (selectDate != null) {
        _dueDate = selectDate;
    }
};
```

### Color Picker
- Widget dimana user bisa memilih color
- Penggunaan color picker bisa digunakan untuk berbagai macam kondisi

**Membuat Color Picker :**
- Menggunakan packages `flutter_colorpicker`
- Menambahkan packages `flutter_colorpicker` di pubspec.yaml
- Mempersiapkan variabel 
```dart
Color _currentColor = Colors.orange;
```

- Membangun UI
```dart
Widget buildColorPicker (BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Text('Color'),
            const SizedBox(height: 10),
            Container(
                height: 100,
                width: double.infinity,
                color: _currentColor,
            ), // Container
            const SizedBox(height: 10),
            Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(_currentColor),
                    ), // ButtonStyle
                    child: const Text('Pick Color'),
                    onPressed: () {},
                ), // ElevatedButton
            ), // Center
        ],
    ),
}; // Column 
```

- Menambahkan fungsi `showDialog` di dalam onPressed dengan return widget `AlertDialog`
```dart
onPressed: () {
    showDialog(
        context: context,
        builder: (context) {
            return AlertDialog(
                title: const Text('Pick Your Color'),
                actions: [
                    TextButton(
                        onPressed: () {
                            Navigator.pop(context);
                        },
                        child: const Text('Save'),
                    ), // TextButton
                ],
            ); // AlertDialog
        },
    );
},
```

- Import packages `flutter_colorpicker` dalam file dart
- Membuat kode untuk penggunaan packages `flutter_colorpicker`
```dart
return AlertDialog(
    title: const Text('Pick Your Color'),
    content: BlockPicker(
        pickerColor: _currentColor,
        onColorChanged: (color) {
            setState(()) {
                _currentColor = color;
            };
        },
    ),
), // BlockPicker
```

- Packages `flutter_colorpicker` memiliki custom widget yang dapat digunakan, seperti **BlockPicker, ColorPicker, dan SlidePicker**

### File Picker
- Kemampuan widget untuk mengakses storage
- Memilih dan membuka file

**Membuat File Picker :**
- Menggunakan packages `file_picker` untuk mengakses storage hp dan `open_file` untuk membuka file
- Menambahkan packages `file_picker` dan `open_file` di pubspec.yaml
- Import packages file_picker dan open_file dalam file dart
- Membangun UI
```dart
Widget buildFilePicker() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Text('Pick Files'),
            const SizedBox(height: 10),
            Center(
                child: ElevatedButton(
                    child: const Text('Pick and Open File'),
                    onPressed: () {},
                ), // ElevatedButton
            ), // Center
        ],
    ); // Column
}
```

- Membuat fungsi untuk mengexplore dan memilih files dari storage
```dart
void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
}
```

- Memanggil fungsi `_pickFile` di dalam onPressed
```dart
Center(
    child: ElevatedButton(
        child: const Text('Pick and Open File'),
        onPressed: () {
            _pickFile();
        },
    ), // ElevatedButton
), // Center
```

- Mmebuat fungsi untuk membuka files yang dipilih
```dart
void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
}
```

- Mengambil file dari object result dan memanggil fungsi _openFile di dalam fungsi _pickFile
```dart
void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    // mendapatkan file dari object result
    final file = result.files.first;
    _openFile(file);
}
```