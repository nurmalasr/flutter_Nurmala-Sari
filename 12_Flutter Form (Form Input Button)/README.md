# Resume Flutter Form (Form Input Button)

**1. Form** digunakan untuk berinteraksi pada pengguna
- Menerima isian data dari pengguna
- Isian data dapat lebih dari satu 

Dalam membuat Form, perlu :
- Menggunakan `StatefulWidget`
- Keadaan form disimpan menggunakan `GlobalKey<FormState>`

```dart
// property
var formKey = GlobalKey<FormState>();

// build 
Form(
    key: formKey, // memanggil variabel formkey
    child: inputWidgets,
);
```

**2. Input** 

### TextField
- Menerima isian data dari pengguna
- Isian data dapat lebih dari satu 

Membuat TextField dengan cara :
- Data diambil menggunakan TextEditingController
- Isian data berupa teks

```dart
// property
var inputController = TextEditingController();

// build
TextField(
    controller: inputController,
);
```

**Method DISPOSE untuk menghapus controller jika tidak digunakan agar tidak mengalami kebocoran memori**

### Radio
- Memberi opsi pada pengguna
- Hanya dapat memilih satu opsi

Membuat Radio, data diambil menggunakan Property dengan tipe data sesuai value pada radio :

```dart
// property
var radioValue = '';

// build
Radio<String>(
    value: 'Laki-laki',
    groupValue: radioValue,
    onChanged: (String? value) {
        setState(()) { // harus stateful
            radioValue = value ?? '';
        }
    }
);
```

### Checkbox
- Memberi opsi pada pengguna
- Dapat memilih beberapa opsi

Membuat Checkbox, data diambil menggunakan Property bertipe **bool**

```dart
// property 
var checkValue = false;

// build
Checkbox(
    value: checkValue, // property value 
    onChanged: (bool? value) {
        setState(()) {
            checkValue = value ?? false;
        }
    }
);
```

### Dropdown Button
- Memberi opsi pada pengguna
- Hanya dapat memilih satu opsi
- Opsi tidak ditampilkan di awal, hanya tampil jika ditekan 

Membuat Dropdown Button, data diambil menggunakan Property dengan tipe data sesuai value pada **DropdownMenuItem** :

```dart
// property
var dropdownValue = 0;

// build
DropdownButton(
    value: dropdownValue,
    onChanged: (int? value) {
        setState(()) {
            dropdownValue = value ?? 0;
        });
    }, 
    items: const [
        DropdownMenuItem(
            value = 0,
            child: Text('Pilih...'),
        ),
        DropdownMenuItem(
            value = 1,
            child: Text('Satu'),
        ),
        DropdownMenuItem(
            value = 2,
            child: Text('Dua'),
        ),
        DropdownMenuItem(
            value = 3,
            child: Text('Tiga'),
        ),
    ],
);
```

**3. Button**
- Bersifat seperti tombol
- Dapat melakukan sesuatu saat ditekan

### ElevatedButton
- Tombol yang timbul 
- Jika ditekan, akan menjalankan **onPressed**

```dart
ElevatedButton(
    child: const Text('Submit'),
    onPressed: () {
        // melakukan sesuatu
    },
);
```

### IconButton
- Tombol yang hanya menampilkan icon
- Jika ditekan, akan menjalankan onPressed

```dart
IconButton(
    icon: const Icon(Icons.add),
    onPressed: () {
        // melakukan sesuatu
    },
);
```








