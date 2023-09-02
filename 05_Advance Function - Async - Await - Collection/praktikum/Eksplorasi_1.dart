/* Buatlah sebuah program untuk menghilangkan nilai atau data yang sama pada sebuah data sehingga output akhirnya adalah sekumpulan nilai atau data yang unik

Sampel Input: [amuse, tommy kaira, spoon, HKS, litchfield, amuse,HKS]
Sampel Output: [amuse, tommy kaira, spoon, HKS, litchfield]
Sampel Input: [JS Racing, amuse, spoon, spoon, JS Racing, amuse]
Sampel Output: [JS Racing, amuse, spoon] */

void main() {
  List<String> input1 = ['amuse', 'tommy kaira', 'spoon', 'HKS', 'litchfield', 'amuse', 'HKS'];
  List<String> input2 = ['JS Racing', 'amuse', 'spoon', 'spoon', 'JS Racing', 'amuse'];

  List<String> dataUnik1 = hapusDuplikasi(input1);
  List<String> dataUnik2 = hapusDuplikasi(input2);

  print("$dataUnik1");
  print('$dataUnik2');
}

List<String> hapusDuplikasi(List<String> data) {
  Set<String> nilaiUnik = Set<String>.from(data); // pakai Set untuk menyaring nilai yang sama menjadi nilai unik
  return nilaiUnik.toList(); // mengubah kembali ke List
}
