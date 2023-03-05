class Book {
  int id;
  String title;
  String publisher;
  double price;
  String category;

  Book(this.id, this.title, this.publisher, this.price, this.category);
}

class BookStore {
  List<Book> books = [];

  void addBook(
      int id, String title, String publisher, double price, String category) {
    Book book = Book(id, title, publisher, price, category);
    books.add(book);
  }

  void getAllBooks() {
    if (books.isEmpty) {
      print("No books available");
    } else {
      print("List of books:");
      for (Book book in books) {
        print("ID: ${book.id}");
        print("Title: ${book.title}");
        print("Publisher: ${book.publisher}");
        print("Price: ${book.price}");
        print("Category: ${book.category}");
        print("--------------");
      }
    }
  }

  void deleteBook(int id) {
    for (Book book in books) {
      if (book.id == id) {
        books.remove(book);
        print("Book with ID $id has been removed");
        return;
      }
    }
    print("Book with ID $id is not found");
  }
}

void main() {
  BookStore bookStore = BookStore();

  // Add books
  bookStore.addBook(1, "The Alchemist", "HarperCollins", 10.99, "Fiction");
  bookStore.addBook(
      2, "To Kill a Mockingbird", "J. B. Lippincott & Co.", 12.99, "Fiction");
  bookStore.addBook(3, "The Lean Startup", "Crown Business", 14.99, "Business");

  // Get all books
  bookStore.getAllBooks();

  print('\n');
  // Delete book with ID 2
  bookStore.deleteBook(2);

  // Get all books again
  bookStore.getAllBooks();
}
