// 2. Implementasikan rumus volume dari tabung (silinder) dengan menggunakan Bahasa Dart

// Rumus Volume Tabung = 3.14 * r * r * t 

double jarijari = 16.0;
double tinggi = 22.3;

void main(){
  double volume = volTabung(jarijari, tinggi);
  print('Volume dari tabung tersebut adalah $volume cm');
}

double volTabung(double jarijari, tinggi){
  return 3.14 * jarijari * jarijari * tinggi;
}
