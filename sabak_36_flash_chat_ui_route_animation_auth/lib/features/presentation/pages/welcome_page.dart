import 'package:flutter/material.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/components/custom_button.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/components/logo_image.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/features/presentation/pages/login_page.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/features/presentation/pages/register_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  static const String id = 'welcome_page';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 7,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                children: [
                  LogoImage(logoSize: 60),
                  Text(
                    'Flash chat',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                color: Colors.lightBlueAccent,
                text: 'Log In',
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                },
              ),
              CustomButton(
                color: Colors.lightBlueAccent,
                text: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegisterPage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _myAppBar() {
    return AppBar(
      backgroundColor: Colors.grey,
    );
  }
}
