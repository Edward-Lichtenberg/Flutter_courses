import 'package:flutter/material.dart';
import 'package:flutter__lesson_15_hw/screen_navigation/style/colors.dart';
import 'package:splashscreen/splashscreen.dart';

import 'second_screen.dart';
import 'style/images.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: const SecondScreen(),
        backgroundColor: StyleColor.colorE5E5E5B,
        image: Image.asset(AppImage.first_srceen_image),
        loadingText: const Text("Loading"),
        photoSize: 110.0,
        loaderColor: Colors.red,
      ),
    );
  }
}
