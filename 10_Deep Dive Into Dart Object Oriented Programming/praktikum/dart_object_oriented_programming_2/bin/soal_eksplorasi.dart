abstract class Shape {
  int getArea();
  int getPerimeter();
}

class Circle implements Shape {
  int r;

  Circle(this.r);

  int getArea() {
    return (3.14 * r * r).round(); // rumus luas lingkaran
  }

  int getPerimeter() {
    return (2 * 3.14 * r).round(); // rumus keliling lingkaran
  }
}

class Square implements Shape {
  int sisi;

  Square(this.sisi);

  int getArea() {
    return sisi * sisi; // rumus luas persegi
  }

  int getPerimeter() {
    return 4 * sisi; // rumus keliling persegi
  }
}

class Rectangle implements Shape {
  int panjang;
  int lebar;

  Rectangle(this.panjang, this.lebar);

  int getArea() {
    return panjang * lebar; // rumus luas PersegiPanjang
  }

  int getPerimeter() {
    return 2 * (panjang + lebar); // rumus keliling PersegiPanjang
  }
}

void main() {
  Circle circle = Circle(5);
  print('Luas Lingkaran: ${circle.getArea()}'); // Output: Circle Area: 78
  print(
      'Keliling Lingkaran: ${circle.getPerimeter()}'); // Output: Circle Perimeter: 31

  print('----------------------');

  Square square = Square(4);
  print('Luas Persegi: ${square.getArea()}'); // Output: Square Area: 16
  print(
      'Keliling Persegi: ${square.getPerimeter()}'); // Output: Square Perimeter: 16

  print('----------------------');

  Rectangle rectangle = Rectangle(5, 10);
  print(
      'Luas PersegiPanjang: ${rectangle.getArea()}'); // Output: Rectangle Area: 50
  print(
      'Keliling PersegiPanjang: ${rectangle.getPerimeter()}'); // Output: Rectangle Perimeter: 30
}
