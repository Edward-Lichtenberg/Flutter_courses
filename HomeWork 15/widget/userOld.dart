import 'package:flutter/material.dart';
import 'package:flutter__lesson_14_authorization/login_page.dart';

class UserOld extends StatelessWidget {
  const UserOld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30),
      child: Container(
        alignment: Alignment.topRight,
        //color: Colors.red,
        height: 50,
        child: Row(
          children: <Widget>[
            const Text(
              'Мы раньше встречались?',
              style: TextStyle(
                fontSize: 20,
                color: Colors.yellowAccent,
              ),
            ),
            TextButton(
              //padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text(
                'Войти',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
