class BooksModel {
  String id;
  String name;
  String authorname;
  int pagenumber;
  BooksModel({
    required this.id , 
    required this.name,
    required this.authorname,
    required this.pagenumber,
  });
  static fromMap(Map<String, dynamic> map) {
    return BooksModel(
      id: map['id'],
      name: map['name'],
      authorname: map['authorname'],
      pagenumber: map['pagenumber'],
    );
  }

}