# Resume Flutter State Management (BLoC)

- BLoC (Business Logic Component)
- Memisahkan antara business logic dengan UI/Widget

**UI > events > BLoC > request > data > response > BLoC > states > UI**

BLoC :
- Simple, mudah digunakan
- Powerful dapat mempercepat proses tertentu
- Testable, mudah dilakukan pengujian

## Cara Kerja BLoC
1. Menerima event sebagai input 
2. Dianalisa dan dikelola di dalam BLoC
3. Menghasilkan state sebagai output

**Event > BLoC > State**

## Stream
- Rangkaian proses secara asinkron
- Aktor utama di dalam BLoC

**Sink => Data Data Data (Stream, Asinkron Data) => Source**