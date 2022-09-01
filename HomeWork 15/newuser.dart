import 'package:flutter/material.dart';
import 'package:flutter__lesson_14_authorization/widget/button.dart';
import 'package:flutter__lesson_14_authorization/widget/newEmail.dart';
import 'package:flutter__lesson_14_authorization/widget/password.dart';
import 'package:flutter__lesson_14_authorization/widget/singup.dart';
import 'package:flutter__lesson_14_authorization/widget/userOld.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SignUp',
      home: NewUser(),
    );
  }
}

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blueGrey, Colors.lightBlueAccent]),
      ),
      child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SingUp(),
              // TextNew(),
            ],
          ),
          // const NewNome(),
          const NewEmail(),
          const PasswordInput(),
          const ButtonLogin(),
          const UserOld(),
        ],
      ),
    ));
  }
}
