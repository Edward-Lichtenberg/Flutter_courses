import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 150,
      child: Center(
        child: Text(
          'Регестрация',
          style: TextStyle(
            fontSize: 38,
            color: Colors.yellowAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
