import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sabak_34_firebase_todo_1/features/presentation/pages/home_page.dart';

class MyTodoPage extends StatefulWidget {
  const MyTodoPage({super.key});

  @override
  State<MyTodoPage> createState() => _MyTodoPageState();
}

class _MyTodoPageState extends State<MyTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todo Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(),
                labelText: 'Biography',
              ),
              maxLines: 8,
            ),
            CheckboxListTile(
              title: const Text('Animate Slowly'),
              value: timeDilation != 1.0,
              onChanged: (bool? value) {
                setState(() {
                  timeDilation = value! ? 10.0 : 1.0;
                });
              },
              secondary: const Icon(Icons.hourglass_empty),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyHomePage();
                  }));
                },
                icon: const Icon(Icons.next_plan),
                label: const Text('Автордук бетке өтүү'))
          ]),
        ),
      ),
    );
  }
}
