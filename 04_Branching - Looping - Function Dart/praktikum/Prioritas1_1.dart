/* Terdapat sebuah nilai :
    1. jika nilai > 70 akan mereturn “Nilai A”
    2. jika nilai > 40 akan mereturn “Nilai B”
    3. jika nilai > 0 akan mereturn “Nilai C”
    4. selain itu return teks kosong */

void main(){

  int nilaiAkhir = 30;
  
  if (nilaiAkhir > 70) {
    print('Nilai A');
  } else if (nilaiAkhir > 40) {
    print('Nilai B');
  } else if (nilaiAkhir > 0) {
    print('Nilai C');
  } else print('');

}