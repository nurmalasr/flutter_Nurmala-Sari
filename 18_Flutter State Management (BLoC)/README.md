# Resume Flutter State Management (BLoC)

Declarative UI bisa disebut juga dengan mendefinisikan tampilan (UI) dan mendeklarasikan tampilan berdasarkan data. State adalah ketika sebuah widget sedang aktif dan widget itu menyimpan data di memori, maka flutter akan membangun ulang UI nya ketika ada state atau data yang berubah. Ada 2 jenis state dalam flutter, yaitu:

- Ephemeral state, pengembangan perangkat lunak yang mengacu pada jenis state yang bersifat temporer atau sementara. Digunakan apabila bagian lain pada widget tree yang membutuhkan untuk mengakses data widget nya, contoh ada PageView, BottomNavBar, dan Switch Button. Ephemeral state tidak memerlukan state management yang kompleks, dan hanya membutuhkan StatefulWidget dengan menggunakan fungsi setState().
- App State, pemngembangan perangkat lunak yang mengacu pada keadaan global yang memengaruhi seluruh aplikasi. Digunakan apabila bagian yang lain suatu aplikasi membutuhkan akses ke data state widget, seperti Login info, pengaturan preferensi pengguna, dan keranjang belanja dimana informasi yang pengguna pilih disuatu screen yang mana informasi itu akan muncul di screen yang berbeda.
  Pendekatan State Management:
- setState, lebih cocok digunakan pada ephemeral state.
- Provider, penggunaan untuk state management yang lebih kompleks seperti App State.
- Bloc, menggunakan pola stream, untuk memisahkan UI dengan bisnis logicnya