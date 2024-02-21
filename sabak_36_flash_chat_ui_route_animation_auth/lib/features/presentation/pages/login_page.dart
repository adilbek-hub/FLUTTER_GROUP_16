import 'package:flutter/material.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/components/custom_button.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/components/login_text_field.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/components/logo_image.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/features/presentation/pages/chat_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String id = 'login_page';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPage'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoImage(logoSize: 300),
              CustomTextField(
                text: 'Аты жөнүңүз',
                onChanged: (maani) {},
              ),
              CustomTextField(
                text: 'Фамилияңыз',
                onChanged: (maani) {},
              ),
              CustomButton(
                color: Colors.lightBlueAccent,
                text: 'Кирүү',
                onPressed: () {
                  Navigator.pushNamed(context, ChatPage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
