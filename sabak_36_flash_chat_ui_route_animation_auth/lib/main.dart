import 'package:flutter/material.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/features/presentation/pages/chat_page.dart';
import 'package:sabak_36_flash_chat_ui_route_animation_auth/features/presentation/pages/login_page.dart';

import 'features/presentation/pages/register_page.dart';
import 'features/presentation/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => const WelcomePage(),
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        ChatPage.id: (context) => const ChatPage(),
      },
    );
  }
}
