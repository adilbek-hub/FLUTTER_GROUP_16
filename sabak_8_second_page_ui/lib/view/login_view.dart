import 'package:flutter/material.dart';
import 'package:sabak_8_second_page_ui/view/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String email = 'adilbek@gmail.com';
  String password = '000a';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffe6e6e6),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/Design circle.png',
                  ),
                ],
              ),
              const Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.network(
                'https://t3.ftcdn.net/jpg/05/68/99/80/360_F_568998040_m42feFA9RajqmuR5DTlWwox44fxE3MOi.jpg',
                width: 200,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 15,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email жазыңыз';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 15,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Сиз пароль жазыыз';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Password',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color(0xff029381),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4ebdaf),
                  minimumSize: const Size(320, 60),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.zero),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xff4ebdaf),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
