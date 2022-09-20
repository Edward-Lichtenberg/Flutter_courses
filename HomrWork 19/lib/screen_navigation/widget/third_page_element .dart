import 'package:flutter/material.dart';
import 'package:flutter__lesson_15_hw/screen_navigation/style/text_styles.dart';

import '../fourth_screen.dart';
import '../style/colors.dart';

class ThirdPageElementState extends StatelessWidget {
  const ThirdPageElementState({
    Key? key,
    required this.image,
    required this.titleText,
    required this.subtitleText,
  }) : super(key: key);

  final String image;
  final String titleText;
  final String subtitleText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const FourthScreen();
          },
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            color: StyleColor.color59A4F2,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(image),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    style: TextStyles.SFProDisplay12x400,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitleText,
                    style: TextStyles.SFProDisplay16x600,
                  )
                ],
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  size: 28,
                  color: StyleColor.colorFFFFFF,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
