//ButtonWidget
import 'package:flutter/material.dart';

import '../edit_profil_screen.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.text, required this.onClicked})
      : super(key: key);

  final String text;
  final VoidCallback onClicked;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.red,
          shape: StadiumBorder(),
          padding: EdgeInsets.all(5)),
      child: Text(text),
      onPressed: onClicked,
    );
  }
}

// widget Button
@override
Widget buildButton(BuildContext context) => ButtonWidget(
      text: 'Редактировать',
      onClicked: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditProfilUser(),
          ),
        );
        // UserPferences.setUser(user);
      },
    );
