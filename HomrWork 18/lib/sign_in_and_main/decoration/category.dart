import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/text_styles.dart';
import 'category_model.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      // width: 107.16,
      // height: 124.59,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [StyleColors.colorF90640, StyleColors.color8F00FF],
        ),
      ),
      // child: Padding(
      //   padding: const EdgeInsets.all(1.0),
      child: Container(
        // width: 107.16,
        // height: 124.59,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: StyleColors.colorFFFFFF),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Image.asset(model.image, height: 40, width: 84),
            const SizedBox(height: 16),
            Text(model.title, style: TextStyles.muller15w700),
            const SizedBox(height: 4),
            Text(model.subtitle, style: TextStyles.muller15w700),
          ],
        ),
      ),
      // ),
    );
  }

  static BoxDecoration Box = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        offset: Offset.zero,
        blurRadius: 10,
        color: StyleColors.colorDED9FF,
      ),
    ],
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        StyleColors.color6322E0.withOpacity(0.91),
        StyleColors.colorD96DFF,
      ],
    ),
  );

  static BoxDecoration BottomBox = BoxDecoration(
    color: StyleColors.colorF9F8FF,
    borderRadius: const BorderRadius.vertical(
      bottom: Radius.circular(8),
    ),
  );
}
