import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sabak_34_firebase_todo_1/features/data/model.dart';
import 'package:sabak_34_firebase_todo_1/features/presentation/pages/home_page.dart';

class MyTodoPage extends StatefulWidget {
  const MyTodoPage({super.key});

  @override
  State<MyTodoPage> createState() => _MyTodoPageState();
}

class _MyTodoPageState extends State<MyTodoPage> {
  bool isComplated = false;
  final nameController = TextEditingController();
  final biographyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> creadTodo() async {
    final db = FirebaseFirestore.instance;
    final creadTodos = Todo(
      name: nameController.text,
      biography: biographyController.text,
      isComplated: isComplated,
    );
    await db.collection('myTodo').add(creadTodos.toMap());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todo Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Атыңызды жазыңыз';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: biographyController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Биографияңызды жазыңыз';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Biography',
                ),
                maxLines: 8,
              ),
              CheckboxListTile(
                title: const Text('Is Complated'),
                value: isComplated,
                onChanged: (value) {
                  setState(() {
                    isComplated = value!;
                  });
                },
                secondary: const Icon(Icons.hourglass_empty),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    creadTodo();
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MyHomePage();
                      }));
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MyHomePage();
                      }));
                    }
                  },
                  icon: const Icon(Icons.next_plan),
                  label: const Text('Автордук бетке өтүү'))
            ]),
          ),
        ),
      ),
    );
  }
}
