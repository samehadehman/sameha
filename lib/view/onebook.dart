import 'package:flutter/material.dart';
import 'package:intro_api_round2/models/books_model.dart';
import 'package:intro_api_round2/srevices/books_service.dart';

class OneBook extends StatelessWidget {
  const OneBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: FutureBuilder(future: getOneBook(), builder: (context , snapshot){
  if(snapshot.hasData){
    BooksModel book = BooksModel.fromMap(snapshot.data);
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Text(book.id),
          ),
          title: Text(book.name),
          subtitle: Text(book.authorname),
          trailing: Text(book.pagenumber.toString()),
        ),
      ],
    );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
           
  }
})
    );
  }
}