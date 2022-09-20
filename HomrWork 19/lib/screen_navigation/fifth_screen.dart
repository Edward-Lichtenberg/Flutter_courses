import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'fourth_screen.dart';
import 'style/colors.dart';
import 'style/text_styles.dart';
import 'widget/button.dart';
import 'widget/text_fifth.dart';

class FifthScreen extends StatelessWidget {
  const FifthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: StyleColor.colorE5E5E5B,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined, size: 19),
          color: StyleColor.color59A4F2,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const FourthScreen();
                },
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: GestureDetector(
              onTap: () {},
              child: Center(
                child: Text(
                  'Редактировать',
                  style: TextStyles.SFProDisplay16x400,
                ),
              ),
            ),
          ),
        ],
      ),
      //Content
      body: Container(
        color: StyleColor.colorE5E5E5B,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const TextFields(
                    text: 'Название',
                    textFieldText: 'Водитель такси',
                    actionKeyboardButton: TextInputAction.next),
                const SizedBox(height: 24),
                const TextFields(
                    text: 'Телефон',
                    textFieldText: '+996-111-22-33-44',
                    actionKeyboardButton: TextInputAction.next),
                const SizedBox(height: 24),
                const TextFields(
                    text: 'Описание',
                    textFieldText: 'Водитель Владимир; четные даты',
                    actionKeyboardButton: TextInputAction.done),
                const SizedBox(height: 40),
                AppButtonBlue(
                  onPress: () {},
                  text: 'Редактировать',
                  style: TextStyles.SFProDisplay18x600,
                ),
                const SizedBox(height: 28),
                AppButtonBlue(
                  onPress: () {},
                  text: 'Удалить',
                  style: TextStyles.SFProDisplay18x600,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
