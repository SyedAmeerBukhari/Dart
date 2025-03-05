class Book {
  String? title;
  String? author;
  bool? isAvailable;

  Book(this.title, this.author, this.isAvailable);
}

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
  }

  void checkOut(String title) {
    for (Book b in books) {
      if (b.title == title) {
        if (b.isAvailable == true) {
          print("Book is available.");
        } else {
          print("Book is not available.");
        }
        return; // Stop searching once found
      }
    }
    print("Book not found.");
}

  void returnBook(String title) {
    for (Book b in books) {
      if (b.title == title) {
        print("Title: ${b.title}");
        print("Author: ${b.author}");
        print("Available: ${b.isAvailable}");
        return; // Stop searching once found
      }
    }
    print("Book not found.");
  }
}

void main() {
  Library library = Library();
  Book book1 = Book("Book 1", "Author 1", true);
  Book book2 = Book("Book 2", "Author 2", false);
  library.addBook(book1);
  library.addBook(book2);
  library.checkOut("Book 1");
  library.checkOut("Book 2");
  library.returnBook("Book 1");
  library.checkOut("Book 2");
}
