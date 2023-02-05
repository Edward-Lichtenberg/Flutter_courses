// import 'dart:html';

import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import 'edit_profil_screen.dart';
import 'mode/user_model.dart';
import 'mode/user_pferences.dart';
import 'weidget/appbar.dart';
import 'weidget/button_widget.dart';
import 'weidget/profil_widget.dart';

class ProfilUser extends StatefulWidget {
  const ProfilUser();

  @override
  State<ProfilUser> createState() => _ProfilUserState();
}

class _ProfilUserState extends State<ProfilUser> {
  @override
  Widget build(BuildContext context) {
    // final user = UserPferences.myUser;
    final user = UserPferences.getUser();
//! Добавить тему
    return Scaffold(
      appBar: bilderAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfilWidget(
            imagePath: user.imagePath,
            onCliced: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditProfilUser(),
                ),
              );
              setState(() {});
            },
          ),
          SizedBox(height: 10),
          buildName(user),
          SizedBox(height: 20),
          buildButton(context),
        ],
      ),
    );
  }
}

// widget NameUser
@override
Widget buildName(User user) => Column(
      children: [
        Text(
          user.name,
          style: AppText.Text24w500.copyWith(color: AppColors.cardInfo),
        ),
        SizedBox(height: 4),
        Text(
          user.email,
          style: AppText.Text24w400.copyWith(color: AppColors.cardInfo),
        )
      ],
    );
