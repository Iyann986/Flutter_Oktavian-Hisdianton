## Summary

## Introduction REST API - JSON serialization deserialization

> 
> Terdapat 3 (tiga) hal utama yang saya pelajari pada *section* ini sebagai berikut.
>
>1. Mengenai REST API dan protokol HTTP. REST API merupakan arsitektural yang memisahkan tampilan dengan proses bisnis. Bagian tampilan dengan proses bisnis berkirim data melalui HTTP *request. Client* akan me-request data dengan method GET/POST/PUT/DELETE, dengan penghubung REST API menuju *server*. *Server* akan me-*response* dengan JSON data yang akan diterima oleh *client*. HTTP sendiri merupakan protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media *web*. Pada Flutter, REST API tersebut dapat dilakukan dengan menggunakan `Dio` yang sekaligus sebagai HTTP *client.* 
>2. Mengenai serialisasi dan deserialiasasi JSON. Serialisasi JSON adalah mengubah struktur data ke bentuk JSON. Contohnya adalah seperti struktur data `map` atau `list` yang merupakan *object*, kemudian dengan serialisasi akan diubah menjadi bentuk JSON. Sedangkan deserialiasi JSON adalah sebaliknya. Serialiasi dan deserialisasi dapat dilakukan pada Flutter dengan menggunakan fungsi `jsonEncode` dan `jsonDecode`.
>3. Mengenai penggunaan *method* REST API. Pada materi bagian kedua, ditunjukkan penggunaan *method* umum REST API, seperti GET (untuk mendapatkan data), POST (untuk menambahkan data), PUT (untuk mengubah data), serta DELETE (untuk menghapus data). Inisialisasi *endpoint* harus ada saat penggunaan *method-method* tersebut.

### **REST API**

REST API memiliki kepanjangan *Representational State Transfer Application Programming Interface*. REST API merupakan arsitektural yang memisahkan tampilan dengan proses bisnis. Bagian tampilan dengan proses bisnis berkirim data melalui HTTP *request.*

*Client* akan me-request data dengan method GET/POST/PUT/DELETE, dengan penghubung REST API menuju *server*. *Server* akan me-*response* dengan JSON data yang akan diterima oleh *client*.

### **HTTP**

HTTP merupakan protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media *web*. Pola komunikasinya, yaitu *client* mengirim sebuah *request*, kemudian *server* mengolah dan membalas dengan memberi *response*.

**Struktur Request**

1. URL, merupakan alamat halaman yang akan diakses.
2. Method, merupakan aksi yang diinginkan. Beberapa di antaranya yaitu GET dan POST untuk mengirim data, PUT untuk mengubah data, serta DELETE untuk menghapus data.
3. Header, merupakan informasi tambahan terkait *request* yang dikirimkan.
4. Body, merupakan data yang disertakan bersama *request*.

**Struktur Response**

1. Status Code, merupakan kode yang mewakili keseluruhan *response*, baik sukses (200-an) maupun gagal (400-an atau 500-an).
2. Header, merupakan informasi tambahan terkait *request* yang dikirimkan.
3. Body, merupakan data yang disertakan bersama *request*.

### **Dio**

Dio merupakan sebuah *package* untuk melakukan REST API yang berperan sebagai HTTP *client* di Flutter. Instalasi dilakukan dengan menambahkan *dependency* `dio` pada `pubspec.yaml` dan menjalankan perintah `flutter pub get` pada terminal.

**Penggunaan**

Contoh penggunaannya yaitu seperti mengambil data menggunakan Dio dan menampilkan hasilnya pada *console* dalam bentuk JSON.
```dart
import 'package:dio/dio.dart';

void main() {
  Dio().get('https://jsonplaceholder.typicode.com/posts/1').then((response) {
    print(response);
  });
}
```

### **Serialisasi dan Deserialisasi JSON**

JSON merupakan JavaScript Object Notation yang umum digunakan pada REST API. Penulisan JSON biasa dilakukan dengan format *key*-*value*. 

**Serialisasi JSON**

Serialisasi JSON adalah mengubah struktur data ke bentuk JSON. Contohnya adalah seperti struktur data `map` atau `list` yang merupakan *object*, kemudian dengan serialisasi akan diubah menjadi bentuk JSON. Proses serialisasi dapat dengan menggunakan fungsi `jsonEncode` dari *package* `dart:convert`.

```dart
import 'dart:convert';
import 'package:dio/dio.dart';

void main() {
  var dataMap = {
    "name": "John Thor",
    "phone" : 085123456789,
  };
  var dataJSON = jsonEncode(dataMap);
  print(dataJSON);
}
```

**Deserialisasi JSON**

Deserialisasi JSON merupakan kebalikan dari serialisasi JSON, yaitu mengubah bentuk JSON ke dalam bentuk suatu struktur data, seperti `map` atau `list`. Proses deserialisasi dapat dengan menggunakan fungsi `jsonDecode` dari *package* `dart:convert`.

```dart
import 'dart:convert';
import 'package:dio/dio.dart';

void main() {
  var dataJSON = '{"name":"John Thor", "phone":085123456789}';
  var dataMap = jsonDecode(dataJSON);
  print(dataMap);
}
```

### **Penggunaan Method GET**

Contoh penggunaan Dio dengan *method* GET.

1. Import Dio.
2. Buat object melalui *package* `Dio`, kemudian di dalam fungsi dipanggil *method* GET melalui Dio beserta inisialisasi *endpoint*. Fungsi berjalan secara *asyncronus*, sehingga wajib menggunakan `await`.
3. Hasil dari fungsi diterima variabel *response* yang bertipe data `Response`.

```dart
import 'package: dio/dio.dart';

class MyService {
  final Dio dio = Dio();

  Future fetchUsers() async {
    try {
      final Response response = await dio.get('https://reqres.in/api/users');

      debugPrint(response.data.toString());

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
```

### **Penggunaan Method POST**
Contoh penggunaan Dio dengan *method* POST.

1. Import Dio.
2. Buat parameter untuk menerima suatu data.
3. Tambahkan data sebagai data yang di-*request* oleh API untuk bisa ditambahkan.

```dart
import 'package: dio/dio.dart';

class MyService {
  final Dio dio = Dio();

  Future createUser({
    required String name,
    required String job,
  }) async {
    final Response response = await dio.post(
      'https://reqres.in/api/users',
      data: {
        'name': name,
        'job': job,
      },
    );
    
    debugPrint(response.data.toString());

    final UserModel _userModel = UserModel.fromJson(response.data);

    return response.data;
  } catch (e) {
    rethrow;
  }
}
```

### **Penggunaan Method PUT**
Contoh penggunaan Dio dengan *method* PUT.

1. Import Dio.
2. Buat parameter untuk menerima suatu data.
3. Tambahkan data sebagai data yang di-*request* oleh API untuk bisa di-*update*.

```dart
import 'package: dio/dio.dart';

class MyService {
  final Dio dio = Dio();

  Future updateUser({
    required String name,
    required String job,
  }) async {
    final Response response = await dio.put(
      'https://reqres.in/api/users/4',
      data: {
        'name': name,
        'job': job,
      },
    );

    debugPrint(response.data.toString());

    return response.data;
  } catch (e) {
    rethrow;
  }
}
```

### **Penggunaan Method DELETE**
Contoh penggunaan Dio dengan *method* DELETE.

1. Import Dio
2. Pada *method* `delete`, *endpoint* ditambahkan `id` data yang ingin di-*delete*.
3. Hasilnya akan berisi data kosong (karena telah terhapus).

```dart
import 'package: dio/dio.dart';

class MyService {
  final Dio dio = Dio();

  Future deleteUser() async {
    try {
      final Response response = await dio.delete('https://regres.in/users/4');

      debugPrint(response.data.toString());

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
```

