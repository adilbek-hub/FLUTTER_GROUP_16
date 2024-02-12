import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabak_34_firebase_todo_1/features/data/model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stream<QuerySnapshot> readData() {
    final db = FirebaseFirestore.instance;
    return db.collection("myTodo").snapshots();
  }

  Future<void> updateTodo(Todo todo) async {
    final db = FirebaseFirestore.instance;
    await db
        .collection('myTodo')
        .doc()
        .update({'isComplated': !todo.isComplated});
  }

  Future<void> deleteTodo(Todo todo) async {
    final db = FirebaseFirestore.instance;
    await db.collection('myTodo').doc().delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('my Home Page'),
        ),
        body: StreamBuilder(
            stream: readData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CupertinoActivityIndicator();
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                List<Todo> todos = snapshot.data!.docs
                    .map((e) => Todo.fromMap(e.data() as Map<String, dynamic>))
                    .toList();
                return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return Card(
                        child: ListTile(
                          leading: Text(todo.name),
                          title: Text(todo.biography),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                  value: todo.isComplated,
                                  onChanged: (value) async {
                                    await updateTodo(todo);
                                  }),
                              IconButton(
                                  onPressed: () async {
                                    await deleteTodo(todo);
                                  },
                                  icon: const Icon(Icons.delete))
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(child: Text('Белгисиз ката кетти'));
              }
            }));
  }
}
