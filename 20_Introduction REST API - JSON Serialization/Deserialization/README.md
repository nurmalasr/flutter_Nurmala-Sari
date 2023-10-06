# Resume Introduction REST API - JSON Serialization

REST API (Representational State Transfer Application Programming Interface)
- Arsitektural yang memisahkan tampilan dengan proses bisnis
- Bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request

## HTTP
Protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web

**Pola Komunikasi**
1. Client mengirim request
2. Server mengolah dan membalas dengan memberi response

**Struktur Request**
- URL : alamat halaman yang akan diakses
- Method (GET, POST, PUT, DELETE) : menunjukkan aksi yang diinginkan
- Header : informasi tambahan terkait request yang dikirimkan
- Body : data yang disertakan bersama request

**Struktur Response**
- Status Code : kode yang mewakili keseluruhan response, baik sukses maupun gagal
- Header : informasi tambahan terkait response yang diberikan
- Body : data yang disertakan bersama response

## DIO 
- Sebuah package yang tersedia di pub get
- Sebagai HTTP Client
- Dimanfaatkan untuk melakukan REST API

**Instalasi**
1. Tambahkan dependency pada `pubspec.yaml`
2. Jalankan perintah `flutter pub get` pada terminal

## Serialisasi JSON
- JSON (JavaScript Object Notation)
- Cara penulisan data, biasanya dalam bentuk **key dan value**
- Umum digunakan pada REST API
- Mengubah struktur data ke bentuk JSON
- Menggunakan fungsi `jsonEncode` dari package **dart:convert**

**Map/List** -> **Serialisasi** -> **JSON**

## Deserialisasi JSON
- Mengubah bentuk JSON ke struktur data
- Menggunakan fungsi `jsonDecode` dari package dart:convert

**JSON** -> **Deserialisasi** -> **Map/List**
