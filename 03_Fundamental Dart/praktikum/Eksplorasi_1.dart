/* 1. Buatlah sebuah program untuk mengecek apakah sebuah kata merupakan sebuah palindrom atau bukan.
Palindrom adalah sebuah kata yang jika dibalik dari kata aslinya memiliki cara baca atau susunan yang sama persis.

Sampel Input: kasur rusak
Sampel Output: palindrom
Penjelasan: kata kasur rusak jika dibalik adalah kasur rusak sehingga kata ini merupakan kata palindrom.

Sampel Input: mobil balap
Sampel Output: bukan palindrom
Penjelasan: kata mobil balap jika dibalik adalah palab libom sehingga kata ini bukan palindrom karena ketika
dibalik cara membacanya menjadi berbeda */

// menggunakan logika boolean untuk pengecekan palindrom
bool kataPalindrom(String kata) {

// fungsi untuk membalikkan kata yang diinputkan
  String balikKata = kata.split('').reversed.join('');
  return kata == balikKata;
}

void main(){
// membuat variabel pengujian 2 sampel dengan String
  String kataPertama = 'kasur rusak';
  String kataKedua = 'mobil balap';

// pengecekan 2 sampel menggunakan percabangan if else
  if (kataPalindrom(kataPertama)) {
    print('Kata $kataPertama jika dibalik adalah kasur rusak sehingga kata ini merupakan kata palindrom');
  } else {
    print('Kata $kataPertama bukan palindrom');
  }

  if (kataPalindrom(kataKedua)) {
    print('Kata $kataKedua merupakan kata palindrom');
  } else {
    print('Kata $kataKedua jika dibalik adalah palab libom sehingga kata ini bukan palindrom');
  }

}


