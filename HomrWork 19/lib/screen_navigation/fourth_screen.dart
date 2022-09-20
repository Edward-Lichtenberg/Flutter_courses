import 'package:flutter/material.dart';
import 'package:flutter__lesson_15_hw/screen_navigation/style/colors.dart';

import 'fifth_screen.dart';
import 'style/text_styles.dart';
import 'third_screen.dart';
import 'widget/button.dart';
import 'widget/reasons.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleColor.colorE5E5E5B,
      // App Bar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: StyleColor.colorE5E5E5B,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 19,
          ),
          color: StyleColor.color59A4F2,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const ThirdScreen();
                },
              ),
            );
          },
        ),
        title: Text(
          'карточка телефона',
          style: TextStyles.SFProDisplay14x500,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: StyleColor.colorF1564A,
              size: 18.2,
            ),
          ),
        ],
      ),
      //Body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Скорая помощь',
              style: TextStyles.SFProDisplay36x600,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '112',
                  style: TextStyles.SFProDisplay41x800,
                ),
                AppButtonRed(
                  onPress: () {},
                  //color: StyleColor.colorF1564A,
                  text: 'Скорая помощь',
                  style: TextStyles.SFProDisplay18x400,
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et sed tempor, at magna purus quam sit id. Ut id aliquam molestie tortor, amet, suspendisse mi. Dictum viverra accumsan a proin amet. Amet, velit consequat enim urna, pellentesque in cursus auctor. Erat a, sapien, nisl id et. Egestas rhoncus, commodo convallis mauris. ',
              style: TextStyles.SFProDisplay16x400,
            ),
            const SizedBox(height: 32),
            // Reasons
            Text(
              'ПРИЧИНА',
              style: TextStyles.SFProDisplay24x600,
            ),
            const SizedBox(height: 24),
            const AppReasons(text: 'Причина'),
            const AppReasons(
              text: 'Причина',
            ),
            const AppReasons(text: 'Причина'),
            const SizedBox(height: 40),

            // Button
            AppButtonBlue(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const FifthScreen();
                    },
                  ),
                );
              },
              //color: StyleColor.color59A4F2,
              text: 'Редактировать',
              style: TextStyles.SFProDisplay18x400,
            ),
          ],
        ),
      ),
    );
  }
}
