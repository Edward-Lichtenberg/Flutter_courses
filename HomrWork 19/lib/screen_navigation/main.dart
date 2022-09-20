import 'package:flutter/material.dart';

import 'ScreenNavigation.dart';

void main() {
  runApp(const SignInAndMain());
}

class SignInAndMain extends StatelessWidget {
  const SignInAndMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreenPage(),
    );
  }
}
