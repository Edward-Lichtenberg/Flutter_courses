import 'package:flutter/material.dart';
import 'package:flutter__lesson_15_hw/screen_navigation/style/colors.dart';

import 'style/images.dart';
import 'widget/third_page_element .dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: StyleColor.colorE5E5E5B,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 55),
              ThirdPageElementState(
                image: AppImage.third_screen_image_1,
                titleText: 'Попали в трудную ситуацию?',
                subtitleText: 'Телефоны служб',
              ),
              const SizedBox(height: 32),
              ThirdPageElementState(
                image: AppImage.third_screen_image_2,
                titleText: 'Тематически провести день?',
                subtitleText: 'Маршруты прогулок',
              ),
              const SizedBox(height: 32),
              ThirdPageElementState(
                image: AppImage.third_screen_image_3,
                titleText: 'Легко общаться с жителями?',
                subtitleText: 'Выучите язык',
              ),
              const SizedBox(height: 32),
              ThirdPageElementState(
                image: AppImage.third_screen_image_4,
                titleText: 'Хотите больше увидеть в России?',
                subtitleText: 'Поездка по городам',
              ),
              const SizedBox(height: 32),
              ThirdPageElementState(
                image: AppImage.third_screen_image_5,
                titleText: 'Нравится духовно развиваться?',
                subtitleText: 'Музеи города',
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
