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
        .doc(todo.id)
        .update({'isComplated': !todo.isComplated});
  }

  Future<void> deleteTodo(Todo todo) async {
    final db = FirebaseFirestore.instance;
    await db.collection('myTodo').doc(todo.id).delete();
  }

  @override
  void initState() {
    super.initState();
    readData();
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
                return const Center(child: CupertinoActivityIndicator());
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                final List<Todo> todos = snapshot.data!.docs
                    .map((e) => Todo.fromMap(e.data() as Map<String, dynamic>)
                      ..id = e.id)
                    .toList();
                return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return Card(
                          child: Column(
                        children: [
                          NameWidget(todo: todo),
                          Text(
                            todo.biography,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Checkbox(
                                  value: todo.isComplated,
                                  onChanged: (v) {
                                    updateTodo(todo);
                                  }),
                              IconButton(
                                onPressed: () {
                                  deleteTodo(todo);
                                },
                                icon: const Icon(Icons.delete),
                              )
                            ],
                          )
                        ],
                      ));
                    });
              } else {
                return const Center(child: Text('Белгисиз ката кетти'));
              }
            }));
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RichText(
        text: TextSpan(
          text: 'Аты-жөнү:',
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
                text: todo.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
