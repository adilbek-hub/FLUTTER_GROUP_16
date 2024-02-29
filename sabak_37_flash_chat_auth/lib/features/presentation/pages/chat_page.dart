import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  static const String id = 'chat_page';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final fireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  Future<void> addMessage() async {
    try {
      fireStore.collection('messages').add({'text': _messageController.text});
    } catch (e) {
      print('error: ${e.toString()}');
    }
  }

  void deleteText() {
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
          child: Column(
            children: [
              StreamBuilder(
                  stream: fireStore.collection('messages').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final messages = snapshot.data!.docs;
                      List<Widget> messageList = [];
                      for (var message in messages) {
                        final messageText = message['text'];
                        final sender = auth.currentUser!.email;
                        final messageWidget = Column(
                          children: [
                            Text('$sender'),
                            Text(' $messageText'),
                          ],
                        );
                        messageList.add(messageWidget);
                      }
                      return Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          height: 300,
                          width: 200,
                          child: ListView.builder(
                              itemCount: messageList.length,
                              itemBuilder: (BuildContext context, index) {
                                return Container(
                                  margin: const EdgeInsets.all(10.0),
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 239, 227, 210),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(0),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                  ),
                                  child: messageList[index],
                                );
                              }),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                  }),
              Spacer(),
              // СМС ЖӨНӨНҮҮЧҮ ОРУН
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _messageController,
                      decoration: new InputDecoration(
                          labelText: "Смс жазуу",
                          labelStyle:
                              new TextStyle(color: const Color(0xFF424242))),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      addMessage();
                      deleteText();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
