import 'package:flutter/material.dart';
import 'package:sabak_13_oop_01_class/features/data/book_method.dart';

class BooksListWidget extends StatelessWidget {
  const BooksListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: booksList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text(
                booksList[index].bookName,
                style: const TextStyle(fontSize: 22),
              ),
              trailing: Text(
                '${booksList[index].pageNumber.toString()} бет',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        });
  }
}
