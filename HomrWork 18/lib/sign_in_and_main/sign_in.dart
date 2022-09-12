import 'package:flutter/material.dart';
import 'MainPages.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 219, 18, 0),
              child: Column(
                children: [
                  const Text('Text'),
                  const SizedBox(
                    height: 36,
                  ),
                  const TextField(),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(),
                  const SizedBox(
                    height: 84,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                    },
                    child: const Text('Button'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
