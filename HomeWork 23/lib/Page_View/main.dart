//!Есть проблема - ОШИБКА
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter__lesson_15_hw/detected_tap/style/select_type_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'theme/color.dart';
import 'theme/img.dart';
import 'theme/text.dart';
import 'theme/text.styles.dart';

//!Есть проблема - ОШИБКА
void main() {
  runApp(const SocialApp());
  // Запрет смены ориентации экрана
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}

class SocialApp extends StatelessWidget {
  const SocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Убираем надпись debug с экрана
      debugShowCheckedModeBanner: false,
      title: Texts.buttonNextText,
      theme: ThemeData(),
      home: const SkipApp(),
    );
  }
}

class SkipApp extends StatefulWidget {
  const SkipApp({Key? key}) : super(key: key);

  @override
  State<SkipApp> createState() => _SkipAppState();
}

class _SkipAppState extends State<SkipApp> {
  late final PageController controller;
  bool showbuttonNext = true;

  @override
  void initState() {
    controller = PageController()
      ..addListener(() {
        if ((controller.page ?? 0) > 0.5) {
          showbuttonNext = false;
        } else {
          showbuttonNext = true;
        }
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: StyleColor.statusBarColor,
      ),
      child: Column(
        children: [
          SafeArea(
            child: Scaffold(
              backgroundColor: StyleColor.backgroundColor,
              appBar: AppBar(
                backgroundColor: StyleColor.backgroundColor,
                actions: [
                  if (showbuttonNext)
                    TextButton(
                      child: Text(Texts.buttonNextText),
                      onPressed: () {
                        controller.nextPage(
                          duration: const Duration(seconds: 2),
                          curve: Curves.bounceInOut,
                        );
                      },
                    ),
                ],
              ),
              body: PageView.builder(
                //itemCount: items.length,
                controller: controller,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        _MainScreen(
                            image: AppImages.fitstScreenImage,
                            title: Texts.firstTitleScreenText,
                            subtitle: Texts.firstParagraphScreenText),
                        _MainScreen(
                            image: AppImages.secondScreenImage,
                            title: Texts.secondTitleScreenText,
                            subtitle: Texts.secondParagraphScreenText)
                      ],
                    ),
                  );

                  //SecondScreen(),
                },
              ),
            ),
          ),
          SmoothPageIndicator(
              controller: controller,
              count: 2,
              effect: const WormEffect(
                dotHeight: 16,
                dotWidth: 16,
                type: WormType.thin,
                // strokeWidth: 5,
              )),
        ],
      ),
    );
  }
}

class _MainScreen extends StatelessWidget {
  const _MainScreen(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle})
      : super(key: key);

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(image),
            const SizedBox(height: 303, width: double.infinity),
            const SizedBox(height: 113),
            Text(
              title,
              style: TextStyles.nunito40w700,
            ),
            const SizedBox(height: 25),
            Text(subtitle,
                style: TextStyles.nunito16w400.copyWith(
                  color: StyleColor.paragraphScreenText,
                ),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
