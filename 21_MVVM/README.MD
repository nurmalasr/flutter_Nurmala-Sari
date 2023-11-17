# Resume MVVM

MVVM (Model-View ViewModel) memisahkan logic dengan tampilan (View) ke dalam ViewModel

Keuntungan memakai MVVM :
1. Reusability, jika ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan ViewModel yang sama
2. Maintainability, Mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic
3. Testability, pengujian terpisah antara tampilan dengan logic sehingga meningkatkan produktivitas

## Struktur Direktori MVVM
- Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data 
- Tiap screen diletakkan dalam sebuah direktori yang didalamnya terdapat View dan ViewModel

**Model**
- Bentuk data yang akan digunakan, dibuat dalam bentuk class
- Data-data yang dimuat diletakkan pada property
- Model API

**ViewModel**
- Menyimpan data-data dan logic yang diperlukan halaman ContactScreen
- Jika widget lain memerlukan logic yang sama, dapat menggunakan viewmodel ini
- Menggunakan MultiProvider untuk mendaftarkan ViewModel agar dapat menggunakan banyak ViewModel
- MaterialApp sebagai child utama

**View**
- Menggunakan StatefulWidget
- Menampilkan data di View dengan cara letakkan pada bagian build
- Menggunakan getters yang ada pada ViewModel
- Data dapat langsung ditampilkan pada widgets
