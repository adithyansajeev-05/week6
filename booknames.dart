void main(){
List<String> books=['Akashdeep ',
                    'Anandmath',
                    'Agnipankh',
                    'Bhadrambhadra',
                    'Barni'];
print("books are :$books");
List<String> searchBooks(List<String> booknames,
           {String category="general"}){
  print("category: $category");
  return booknames.where((name)=>name.startsWith('A')).toList();
}
print("book names starts with 'A'");
print(searchBooks(books));
}