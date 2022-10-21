//!Есть проблема - ОШИБКА в main.dart
import 'package:flutter/material.dart';
import 'package:flutter__lesson_15_hw/Page_View/theme/text.dart';

import 'theme/img.dart';

class MainScreen extends StatelessWidget {
  MainScreen(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle})
      : super(key: key);

  final String image;
  final String title;
  final String subtitle;

  final List<MainScreen> item = <MainScreen>[
    MainScreen(
        image: AppImages.fitstScreenImage,
        title: Texts.firstTitleScreenText,
        subtitle: Texts.firstParagraphScreenText),
    MainScreen(
        image: AppImages.secondScreenImage,
        title: Texts.secondTitleScreenText,
        subtitle: Texts.secondParagraphScreenText)
    // padding: const EdgeInsets.all(16.0),
    // child: Column(
    //   children: [
    //     const SizedBox(height: 20, width: double.infinity),
    //     Image.asset(image),
    //     const SizedBox(height: 113),
    //     Text(
    //       title,
    //       style: TextStyles.nunito40w700,
    //     ),
    //     const SizedBox(height: 25),
    //     Text(subtitle,
    //         style: TextStyles.nunito16w400.copyWith(
    //           color: StyleColor.paragraphScreenText,
    //         ),
    //         textAlign: TextAlign.center),
    //   ],
    // ),
  ];

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion(
//       value: SystemUiOverlayStyle.dark.copyWith(
//         statusBarColor: StyleColor.statusBarColor,
//       ),
//       child: SafeArea(
//         child: Scaffold(
//             backgroundColor: StyleColor.backgroundColor,
//             appBar: StyleColor.appBar,
//             body: PageView(
//               children: const [
//                 FirstScreen(),
//                 SecondScreen(),
//               ],
//             )),
//       ),
//     );
//   }
// }