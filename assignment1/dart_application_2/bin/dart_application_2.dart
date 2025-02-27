Map<String, Map<String, dynamic>> library = {};
//#1
void addBook({required String title , int year=0, String auther="un", String genre="genre" }){

library[title] = {"year": year, "auther": auther, "genre": genre}; 
  print("Book" " $title " "  added successfully :)");
}
//#2
String getBookInfo({required String title}) {
  if (library.containsKey(title)) {
     
    var book =library[title]!;
    return "title: $title ,  Year: ${book['year']},${book['auther']}, Genre: ${book['genre']}";

    }
  else { return "Book not found :(" ;}
  }

//#3
void listAllBooks({String genre = ''}) {
  if (library.isEmpty) {
    print('No books in the library.');
    return;
  }
  
  bool filterByGenre = genre.isNotEmpty;
  
  library.forEach((title, details) {
    if (!filterByGenre || details['genre'] == genre) {
      print(getBookInfo(title: title));
    }
  });
}

//#4
List<String> listBooksByGenre({required String genre}) {
  List<String> books = [];
  library.forEach((title, details) {
    if (details['genre'] == genre) {
      books.add(title);
    }
  });
  
  return books.isNotEmpty ? books : ['No books found for this genre.'];

}
//#5
String removeBook({required String title}) {
  if (library.remove(title) != null) {
    return 'Book "$title" removed successfully.';
  }

  return 'Book not found.';
}


void main(List<String> arguments) {
    addBook(title: "Great Crimes",  year: 2016, auther: "John Escott", genre: "literature and Poetry");
    addBook(title:"Grade 7",year: 2012, auther:"Chris Welles Feder", genre:"Children");
    addBook(title:"Rodrick Rules",year: 2009, auther:"Jeff Kinney", genre:"Children");
    addBook(title: "The Old Man and the Sea",  year: 1954, auther: "Ernest Hemingway", genre: "Literature");
    addBook(title: "To Kill a Mockingbird",  year: 1960, auther: "Harper Lee", genre: "Literature");


   

print("-------------------- \n");

   print(getBookInfo(title: "Great Crimes"));

   print(getBookInfo(title: "Grade 7"));
    print(getBookInfo(title: "Rodrick Rules"));

print("-------------------- \n");
    print('\nListing all books:');
   listAllBooks();

   print("-------------------- \n");

  //  print(removeBook(title: "Grade 7"));

   print("-------------------- \n");
   print (listBooksByGenre(genre: "Children"));

   print(listBooksByGenre(genre: "literature and Poetry"));
   print(listBooksByGenre(genre: "Literature"));




}