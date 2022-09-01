import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final password = TextEditingController();
  bool _showPassword = false;
  String signInStatus = '';

  @override
  void initState() {
    //email.addListener(() {});
    password.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    //email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Пароль',
          style: TextStyle(
            letterSpacing: 1,
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 30, 128, 11),
          ),
          child: TextField(
            controller: password,
            textInputAction: TextInputAction.done,
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14),
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(
                    () {
                      _showPassword = !_showPassword;
                    },
                  );
                },
                child: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
              hintText: 'Введите пароль',
              hintStyle: const TextStyle(
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            obscureText: !_showPassword, // Скрыть/показать текст точками
            onSubmitted: (v) {
              _PasswordInputState();
            },
          ),
        ),
      ],
    );
  }
  /*Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: const TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Password',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }*/
}
