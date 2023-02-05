import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'mode/user_model.dart';
import 'mode/user_pferences.dart';
import 'weidget/appbar.dart';
import 'weidget/button_widget.dart';
import 'weidget/profil_widget.dart';
import 'weidget/text_field_widget.dart';

class EditProfilUser extends StatefulWidget {
  const EditProfilUser();

  @override
  State<EditProfilUser> createState() => _EditProfilUserState();
}

class _EditProfilUserState extends State<EditProfilUser> {
  // User user = UserPferences.myUser;
  late User user;

  @override
  void initState() {
    super.initState();

    user = UserPferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    //! Добавить тему
    return Scaffold(
      appBar: bilderAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfilWidget(
            imagePath: user.imagePath,
            isEdit: true,
            onCliced: () async {
              final image =
                  await ImagePicker().getImage(source: ImageSource.gallery);
              if (image == null) return;
              final directory = await getApplicationDocumentsDirectory();
              final name = basename(image.path);
              final imageFile = File('${directory.path}/$name');
              final newImage = await File(image.path).copy(imageFile.path);

              setState(() => user = user.copy(imagePath: newImage.path));
            },
          ),
          SizedBox(height: 24),
          TextFieldWidget(
            label: 'Full Name',
            text: user.name,
            onChanged: (name) => user = user.copy(name: name),
          ),
          SizedBox(height: 24),
          TextFieldWidget(
            label: 'Email',
            text: user.email,
            onChanged: (email) => user = user.copy(email: email),
          ),
          SizedBox(height: 50),
          ButtonWidget(
            text: 'Save',
            onClicked: () {
              UserPferences.setUser(user);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
