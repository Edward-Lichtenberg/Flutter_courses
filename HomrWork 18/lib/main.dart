import 'package:flutter/material.dart';
import 'package:flutter__lesson_14_authorization/sign_in_and_main/sign_in.dart';

void main() {
  runApp(const SignInAndMain());
}

class SignInAndMain extends StatelessWidget {
  const SignInAndMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In And Main Pages',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
    );
  }
}
