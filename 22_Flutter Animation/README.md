## Summary

## Flutter Animation

> 
> Terdapat 3 (tiga) hal utama yang saya pelajari pada *section* ini sebagai berikut.
>
>1. Mengenai *animation* pada aplikasi. Adanya animasi pada suatu tampilan aplikasi tentunya akan membuat aplikasi terasa lebih hidup.
>2. Mengenai *implicit animation* pada Flutter. *Implicit animation* merupakan versi *animation* yang telah ada atau telah menjadi bagian dari *widget* bawaan Flutter. Sebagai contoh, yaitu *animation* yang terdapat pada *widget* `container`. Biasanya, properti yang digunakan adalah `duration` dengan melihat kondisi dari *state*.
>3. Mengenai *transition* pada Flutter. *Transition* merupakan jenis *animation* yang terjadi saat perpindahan halaman. Biasanya dilakukan pada bagian `Navigator.push()`. Contoh *transition* yang sering digunakan adalah `FadeTransition` dan `ScaleTransition`.

### **Animation**

Adanya *animation* pada suatu tampilan aplikasi tentunya akan membuat aplikasi terasa lebih hidup. *Widget* yang bergerak secara halus dari kondisi A ke kondisi B karena suatu interaksi tertentu akan menambah daya tarik tersendiri bagi pengguna.


### **Implicit Animation**

*Implicit animation* merupakan versi *animation* yang telah ada atau telah menjadi bagian dari *widget* bawaan Flutter. Sebagai contoh, yaitu *animation* yang terdapat pada *widget* `container`.

Tanpa *animation*, perubahan ukuran `container` tampak kaku.

```dart
// state
bool isBig = false;

// container berubah ukuran 
// jika isBig = true, tinggi dan lebar menjadi 200
// jika isBig = false, tinggi dan lebar menjadi 100
Container(
	width: isBig ? 200 : 100,
	height: isBig ? 200 : 100,
	color: Colors.red,
);
```

Dengan *animation*, perubahan ukuran `container` menjadi lebih hidup dan nyaman dilihat.

```dart
// state
bool isBig = false;

// container berubah ukuran dengan animasi
// jika isBig = true, tinggi dan lebar menjadi 200
// jika isBig = false, tinggi dan lebar menjadi 100
Container(
	width: isBig ? 200 : 100,
	height: isBig ? 200 : 100,
	color: Colors.red,
	duration: const Duration(miliseconds: 300),
);
```
### **Transition**

*Transition* merupakan jenis *animation* yang terjadi saat perpindahan halaman. Biasanya dilakukan pada bagian `Navigator.push()`. Contoh penggunaan *transition* adalah sebagai berikut.

```dart
Navigator.of(context).push(
	// mengatur proses navigasi terjadi
	PageRouteBuilder(
		
		// proses pembuatan halaman AboutScreen
		pageBuilder: (context, aniamtion, secondaryAnimation) {
			return const AboutScreen();
		},

		// proses mengatur transition
		// halaman AboutScreen muncul dari tengah halaman
		// menuju ke halaman penuh dengan transisi bergeser (slide)
		transitionsBuilder: (context, animation, secondaryAnimation) {
			final tween = Tween(begin: const Offset(0, .5), end: Offset.zero);
			
			return SlideTransition(
				position: animation.drive(tween),
				child: child,
			);
		},
	),
);
```

### **Transition Umum**

Terdapat beberapa *transition* yang umum pada aplikasi sebagai berikut.

1. **FadeTransition**
    
    *Transition* ini membuat halaman muncul dengan efek redup menuju ke tampak jelas secara penuh.
    
    ```dart
    final tween = Tween(begin: 0.0, end: 1.0);
    return FadeTransition(
    	opacity: animation.drive(tween),
    	child: child,
    );
    ```
    


2. **ScaleTransition**
    
    *Transition* ini membuat halaman muncul dengan efek berubah ukuran dari tidak penuh menuju tampil keseluruhan.
    
    ```dart
    final tween = Tween(begin: 0.0, end: 1.0);
    return ScaleTransition(
    	scale: animation.drive(tween),
    	child: child,
    );
    ```