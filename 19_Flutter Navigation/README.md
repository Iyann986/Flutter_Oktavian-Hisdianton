## Summary

## Flutter Navigation
Flutter Navigation adalah cara untuk berpindah antara satu layar ke layar lain dalam aplikasi. Flutter menyediakan dua cara untuk melakukan navigasi, yaitu dengan menggunakan Navigation Dasar (Basic Navigation) dan Navigation dengan Routes.

- Navigation Dasar (Basic Navigation)
  Navigation Dasar pada Flutter menggunakan widget Navigator dan MaterialApp. Dalam Navigation Dasar, setiap halaman atau layar didefinisikan sebagai widget, dan setiap transisi dari satu layar ke layar lain diinisiasi oleh widget yang memicu aksi tersebut, misalnya tombol.
  
  Dalam Navigation Dasar, kita membuat tampilan untuk halaman baru dan kemudian menambahkan halaman tersebut ke dalam stack yang dikelola oleh widget Navigator. Kemudian, untuk berpindah ke halaman baru, kita memanggil fungsi Navigator.push() dengan konteks BuildContext dan halaman baru sebagai argumen. Untuk kembali ke halaman sebelumnya, kita dapat memanggil fungsi Navigator.pop().

- Navigation dengan Routes
  Navigation dengan Routes adalah cara lain untuk melakukan navigasi antara layar dalam aplikasi Flutter. Pada Navigation dengan Routes, setiap halaman didefinisikan sebagai sebuah widget dengan nama dan ditetapkan pada sebuah routing table. Ketika kita ingin berpindah ke halaman baru, kita hanya perlu menentukan nama halaman tersebut, dan Flutter akan mencari halaman tersebut di routing table dan menavigasi aplikasi ke halaman yang ditentukan.
  
  Untuk menggunakan Navigation dengan Routes, kita perlu menambahkan routing table ke dalam MaterialApp, dan mengatur navigasi pada widget yang memicu aksi tersebut, seperti tombol. Ketika tombol ditekan, Flutter akan menavigasi aplikasi ke halaman yang terkait dengan nama halaman yang diberikan.
