# Resume Flutter Layout 

Layout digunakan untuk mengatur tata letak beberapa material seperti image, text, dll. Layout berbentuk widget yang mengatur widget di dalamnya

## Single-child Layout 
Hanya dapat memiliki satu buah child saja seperti **container, sizebox, dll**

**1. Container** 
- Membuat sebuah box
- Membungkus widget lain
- Box memiliki margin, padding dan border 
-  

```dart
Container(
    child: Text(teks),
);
```

Implementasi Container :

```dart
Container(
    margin: const EdgeInsets.all(10), // jarak antara container dgn bagian luar container (diluar)
    padding: const EdgeInsets.all(10), // jarak antara child dgn containernya (didalam)
    decoration: BoxDecoration( // styling 
        border: Border.all(), // menambahkan border 
    ),
    child: const Text('HALO'), // memberikan widget lain berupa teks, di dalam container 
);
```

**2. Center**
- Membuat sebuah box
- Membungkus widget lain
- Memenuhi lebar dan tinggi ruang di luarnya
- Meletakkan widget berada di bagian tengah

```dart
Center(
    child: Text(teks),
)
```

**3. SizedBox**
- Membuat sebuah box
- Membungkus widget lain
- Box dapat diatur lebar dan tingginya
- Lebih sederhana dari Container, tugasnya untuk mengatur lebar dan tinggi dari widget childnya aja

```dart
SizedBox(
    width: 100,
    height: 150,
    child: Text(teks),
);
```

## Multi-child Layout 
Jika ingin meletakkan child widget lebih dari satu, akan menggunakan Property **Children** yang tipenya Array widget 

**1. Column**
- Mengatur widgets secara vertikal 

```dart
Column(
    children: const [
        Text(teks),
        Text(teks),
        Text(teks),
    ],
);
```

Penggunaan Column :

```dart
Column(
    children: [
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('H'),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('A'),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('L'),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('O'),
        ),
    ],
);
```

**2. Row**
- Mengatur widgets secara horizontal

```dart
Row(
    children: const [
        Text(teks),
        Text(teks),
        Text(teks),
        Text(teks),
    ],
);
```

Penggunaan Row

```dart
Row(
    children: [
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('H'),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('A'),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('L'),
        ),
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('O'),
        ),
    ],
);
```

**3. ListView**
- Mengatur widgets dalam bentuk list
- Memiliki kemampuan scroll

```dart
ListView(
    children: [
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('H'),
        ),
    ],
);
```

**4. GridView**
- Mengatur widgets dalam bentuk galeri

```dart
GridView.count( // untuk menerapkan jumlah grid yang ingin diterapkan 
    crossAxisCount: angka, 
    children: [],
);
```

Penggunaaan GridView :

```dart
GridView.count(
    crossAxisCount: 2, // jumlah Grid
    children: [
        Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text('H'),
        ),
    ],
);
```