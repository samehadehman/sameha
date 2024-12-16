import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intro_api_round2/models/books_model.dart';

Future<dynamic> getOneBook() async {
  Dio dio = Dio();
  Response response =
      await dio.get('https://6750484a69dc1669ec1a71a4.mockapi.io/book/1');
  return response.data;
}

Future<dynamic> getAllBooks() async {
  Dio dio = Dio();
  try {
    Response response =
        await dio.get('https://6750484a69dc1669ec1a71a4.mockapi.io/book');
    if (response.statusCode == 200) {
      List<BooksModel> books = [];
      for (var i = 0; i < response.data.length; i++) {
        var book = BooksModel.fromMap(response.data[i]);
        books.add(book);
      }
      return books;
    } else {
      return [
        BooksModel(
            id: '-1', name: 'Exception', authorname: 'Check your internet connection' , pagenumber: 0)
      ];
    }
  } catch (e) {
    print(e);
    return [
      BooksModel(
          id: '-1', name: 'Exception', authorname: 'Check your internet connection' , pagenumber: 0)
    ];
  }
}

