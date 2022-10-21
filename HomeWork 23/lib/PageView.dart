import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Page_View/theme/img.dart';
import 'Page_View/theme/text.dart';
import 'Page_View/theme/text.styles.dart';

void main() {
  runApp(const MysmoothIndicator());
} // main function

class MysmoothIndicator extends StatefulWidget {
  const MysmoothIndicator({super.key});

  @override
  _MysmoothIndicatorState createState() => _MysmoothIndicatorState();
}

class _MysmoothIndicatorState extends State<MysmoothIndicator> {
  // variable controller
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
// materialApp
    return MaterialApp(
      // Убираем надпись debug с экрана
      debugShowCheckedModeBanner: false,
      title: 'PageView + SPI Worm',
      // scaffold
      home: Scaffold(
        appBar: AppBar(title: const Text('PageView + SPI Worm')),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 450,
                // pageview
                child: PageView(
                  controller: controller,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      child: Center(
                        // color: Colors.white70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.fitstScreenImage),
                            Text(Texts.firstTitleScreenText,
                                style: TextStyles.nunito40w700),
                            Text(Texts.firstParagraphScreenText,
                                style: TextStyles.nunito16w400)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        //color: Colors.black26,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(AppImages.secondScreenImage),
                            Text(Texts.secondTitleScreenText,
                                style: TextStyles.nunito40w700),
                            Text(Texts.secondParagraphScreenText,
                                style: TextStyles.nunito16w400)
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: const WormEffect(),
                ),
              ),
              const SizedBox(height: 10),
              SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: const JumpingDotEffect(
                  dotHeight: 16,
                  dotWidth: 16,
                  jumpScale: .7,
                  verticalOffset: 15,
                ),
              ),
              const SizedBox(height: 10),
              SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: const SwapEffect(
                  dotHeight: 16,
                  dotWidth: 16,
                  type: SwapType.yRotation,
                ),
              ),
              const SizedBox(height: 10),
              SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: const ScrollingDotsEffect(
                    activeStrokeWidth: 2.6,
                    activeDotScale: 1.3,
                    maxVisibleDots: 5,
                    radius: 8,
                    spacing: 10,
                    dotHeight: 12,
                    dotWidth: 12,
                  )),
              const SizedBox(height: 10),
              SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                    width: 32,
                    height: 12,
                    color: Colors.indigo,
                    rotationAngle: 180,
                    verticalOffset: -10,
                    borderRadius: BorderRadius.circular(24),
                    // dotBorder: DotBorder(
                    //   padding: 2,
                    //   width: 2,
                    //   color: Colors.indigo,
                    // ),
                  ),
                  dotDecoration: DotDecoration(
                    width: 24,
                    height: 12,
                    color: Colors.grey,
                    // dotBorder: DotBorder(
                    //   padding: 2,
                    //   width: 2,
                    //   color: Colors.grey,
                    // ),
                    // borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(2),
                    //     topRight: Radius.circular(16),
                    //     bottomLeft: Radius.circular(16),
                    //     bottomRight: Radius.circular(2)),
                    borderRadius: BorderRadius.circular(16),
                    verticalOffset: 0,
                  ),
                  spacing: 6.0,
                  // activeColorOverride: (i) => colors[i],
                  inActiveColorOverride: (i) => colors[i],
                ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}

const colors = [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.amber,
];
//               ],
//             )),
//       ),
//     );
//   }
// }

/*import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'detected_tap/content/images.dart';
import 'detected_tap/content/images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: PageViewBuilder(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ObjectView {
  //final String image;
  final String title;
  final String subtitle;
  ObjectView({
    //required this.image,
    required this.title,
    required this.subtitle,
  });
}

final List<ObjectView> item = [
  ObjectView(
    //image: Image.asset(AppImages.avatar),
    title: '1',
    subtitle: '2',
  ),
  ObjectView(
    //image: Images.screen2,
    title: '11',
    subtitle: '22',
  ),
];

class PageViewBuilder extends StatefulWidget {
  const PageViewBuilder({super.key});

  @override
  State<PageViewBuilder> createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  late final PageController controller;
  bool showNextButton = true;
  bool showBackButton = true;

  @override
  void initState() {
    controller = PageController()
      ..addListener(() {
        if ((controller.page ?? 0) > 0.5) {
          showNextButton = false;
          showBackButton = true;
        } else {
          showNextButton = true;
          showBackButton = false;
        }
        //log(controller.page.toString());
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (showNextButton)
            TextButton(
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
            ),
        ],
        leading: Column(
          children: [
            if (showBackButton)
              TextButton(
                child: const Text(
                  'Back',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  controller.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 700,
            child: PageView.builder(
              itemCount: item.length,
              controller: controller,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Image.asset(AppImages.avatar),
                        ),
                        const SizedBox(height: 114),
                        Text(
                          item[index].title,
                        ),
                        const SizedBox(height: 25),
                        Text(
                          item[index].subtitle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: item.length,
            effect: const WormEffect(
              dotHeight: 16,
              dotWidth: 16,
              type: WormType.thin,
              // strokeWidth: 5,
            ),
          ),
        ],
      ),
    );
  }
}
*/
/*
//Индикатор, показывающий текущую выбранную страницу PageController
class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    Key? key,
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color = Colors.white,
  }) : super(key: key, listenable: controller);

  // PageController, который представляет этот DotsIndicator.
  final PageController controller;
  // Количество предметов, управляемых PageController
  final int itemCount;
  // Вызывается при касании точки
  final ValueChanged<int> onPageSelected;
  //Цвет точек. По умолчанию `Colors.white`.
  final Color color;
  // Базовый размер точек
  static const double _kDotSize = 8.0;
  // Увеличение размера выделенной точки
  static const double _kMaxZoom = 2.0;
  // Расстояние между центром каждой точки
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return Container(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final _controller = PageController();

  static const _kDuration = Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  final List<Widget> _pages = <Widget>[
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: const FlutterLogo(textColor: Color.fromARGB(255, 180, 243, 33)),
    ),
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: const FlutterLogo(
          style: FlutterLogoStyle.stacked, textColor: Colors.black),
    ),
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: const FlutterLogo(
          style: FlutterLogoStyle.horizontal, textColor: Colors.green),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconTheme(
        data: IconThemeData(color: _kArrowColor),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                color: Colors.grey[800]?.withOpacity(0.5),
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: DotsIndicator(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: PageViewDemo(),
        ),
      ),
    );
  }
}

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        MyPage1Widget(),
        MyPage2Widget(),
        MyPage3Widget(),
      ],
    );
  }
}

class MyPage1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            MyBox(darkGreen, height: 50),
          ],
        ),
        Row(
          children: [
            MyBox(lightGreen),
            MyBox(lightGreen),
          ],
        ),
        MyBox(mediumGreen, text: 'PageView 1'),
        Row(
          children: [
            MyBox(lightGreen, height: 200),
            MyBox(lightGreen, height: 200),
          ],
        ),
      ],
    );
  }
}

class MyPage2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            MyBox(darkBlue, height: 50),
            MyBox(darkBlue, height: 50),
          ],
        ),
        Row(
          children: [
            MyBox(lightBlue),
            MyBox(lightBlue),
          ],
        ),
        MyBox(mediumBlue, text: 'PageView 2'),
        Row(
          children: [
            MyBox(lightBlue),
            MyBox(lightBlue),
          ],
        ),
      ],
    );
  }
}

class MyPage3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            MyBox(darkRed),
            MyBox(darkRed),
          ],
        ),
        MyBox(mediumRed, text: 'PageView 3'),
        Row(
          children: [
            MyBox(lightRed),
            MyBox(lightRed),
            MyBox(lightRed),
          ],
        ),
      ],
    );
  }
}

const lightBlue = Color(0xff00bbff);
const mediumBlue = Color(0xff00a2fc);
const darkBlue = Color(0xff0075c9);

final lightGreen = Colors.green.shade300;
final mediumGreen = Colors.green.shade600;
final darkGreen = Colors.green.shade900;

final lightRed = Colors.red.shade300;
final mediumRed = Colors.red.shade600;
final darkRed = Colors.red.shade900;

class MyBox extends StatelessWidget {
  final Color color;
  final double height;
  final String text;

  const MyBox(this.color, {required this.height, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        color: color,
        height: (height == null) ? 150 : height,
        child: (text == null)
            ? null
            : Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
*/

// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final PageController controller = PageController();
//     return PageView(
//       /// [PageView.scrollDirection] defaults to [Axis.horizontal].
//       /// Use [Axis.vertical] to scroll vertically.
//       controller: controller,
//       children: const <Widget>[
//         Center(
//           child: Text('First Page'),
//         ),
//         Center(
//           child: Text('Second Page'),
//         ),
//         Center(
//           child: Text('Third Page'),
//         ),
//       ],
//     );
//   }
// }

// class ViewPage extends StatefulWidget {
//   const ViewPage({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _ViewPageState();
// }

// class _ViewPageState extends State<ViewPage> {
//   var imgList = [
//     'https://miro.medium.com/max/943/1*CUb9OafLcX8Xt0vSoUWAhA.png',
//     'https://i2.wp.com/codingwithdhrumil.com/wp-content/uploads/2021/01/Pageview-Flutter-With-Example6.jpg?w=800&ssl=1'
//     //'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582796218195&di=04ce93c4ac826e19067e71f916cec5d8&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F344fda8b47808261c946c81645bff489c008326f15140-koiNr3_fw658'
//   ];
//   late PageController _pageController;

//   var _currPageValue = 0.0;
//   // Коэффициент масштабирования
//   final double _scaleFactor = .8;
//   //посмотреть высоту страницы
//   final double _height = 230.0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(viewportFraction: 0.9);
//     _pageController.addListener(() {
//       setState(() {
//         _currPageValue = _pageController.page!;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _pageController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: _height,
//         child: PageView.builder(
//           itemBuilder: (context, index) => _buildPageItem(index),
//           itemCount: 10,
//           controller: _pageController,
//         ));
//   }

//   _buildPageItem(int index) {
//     Matrix4 matrix4 = Matrix4.identity();
//     if (index == _currPageValue.floor()) {
//       // Текущий элемент
//       var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
//       var currTrans = _height * (1 - currScale) / 2;

//       matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
//         ..setTranslationRaw(0.0, currTrans, 0.0);
//     } else if (index == _currPageValue.floor() + 1) {
//       // Элемент справа
//       var currScale =
//           _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
//       var currTrans = _height * (1 - currScale) / 2;

//       matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
//         ..setTranslationRaw(0.0, currTrans, 0.0);
//     } else if (index == _currPageValue.floor() - 1) {
//       //Слева
//       var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
//       var currTrans = _height * (1 - currScale) / 2;

//       matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
//         ..setTranslationRaw(0.0, currTrans, 0.0);
//     } else {
//       // Другое, элементы не отображаются на экране
//       matrix4 = Matrix4.diagonal3Values(1.0, _scaleFactor, 1.0)
//         ..setTranslationRaw(0.0, _height * (1 - _scaleFactor) / 2, 0.0);
//     }

//     return Transform(
//       transform: matrix4,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             image: DecorationImage(
//                 image: NetworkImage(imgList[index % 2]), fit: BoxFit.fill),
//           ),
//         ),
//       ),
//     );
//   }
// }
