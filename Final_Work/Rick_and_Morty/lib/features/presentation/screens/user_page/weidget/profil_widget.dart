// ProfilWidget

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/colors.dart';
import '../../../theme/model/model_theme.dart';

class ProfilWidget extends StatelessWidget {
  const ProfilWidget(
      {Key? key,
      required this.imagePath,
      required this.onCliced,
      this.isEdit = false})
      : super(key: key);

  final String imagePath;
  final bool isEdit;
  final VoidCallback onCliced;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(children: [
        buildImage(),
        Positioned(
          bottom: 0,
          right: 4,
          child: buildEditIcon(color),
        ),
      ]),
    );
  }

// Widget UserImage
  Widget buildImage() {
    // final image = NetworkImage(imagePath);
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          // image: image,
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onCliced),
        ),
      ),
    );
  }

// widget EditIcon
  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.indigo,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Consumer<ModelTheme>(
              builder: (context, ModelTheme themeNotifier, child) {
            return Icon(
              isEdit ? Icons.add_a_photo : Icons.edit,
              color: themeNotifier.isDark
                  ? Colors.greenAccent
                  : AppColors.iconsNotActiveColor,
              size: 20,
            );
          }),
        ),
      );
// widget CircleEditIcon
  buildCircle(
          {required Color color, required double all, required Widget child}) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
