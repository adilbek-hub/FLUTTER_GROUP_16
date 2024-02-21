import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/components/custom_button.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/components/login_text_field.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/components/logo_image.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/features/presentation/pages/chat_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const String id = 'register_page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  void signUp() {
    if (_formKey.currentState!.validate()) {
      auth
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .whenComplete(
            () => ScaffoldMessenger.of(context)
                .showSnackBar(
                  const SnackBar(
                    content: Text("Successfully Signed Up"),
                  ),
                )
                .closed
                .whenComplete(
                  () => Navigator.pushNamed(context, ChatPage.id),
                ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterPage'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoImage(logoSize: 200),
                CustomTextField(
                  controller: _emailController,
                  text: 'Электрондук почтаңыз',
                  onChanged: (maani) {},
                ),
                CustomTextField(
                  controller: _passwordController,
                  text: 'Сыр сөз',
                  onChanged: (maani) {},
                ),
                CustomButton(
                  color: Colors.lightBlueAccent,
                  text: 'Кирүү',
                  onPressed: () {
                    signUp();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
