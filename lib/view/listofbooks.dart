import 'package:flutter/material.dart';
import 'package:intro_api_round2/srevices/books_service.dart';

class ListOfBooks extends StatelessWidget {
  const ListOfBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAllBooks(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        snapshot.data[index].id.toString(),
                      ),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].authorname),
                    trailing: Text(snapshot.data[index].pagenumber.toString()),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('check internt connection'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}