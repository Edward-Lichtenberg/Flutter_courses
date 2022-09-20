import 'package:flutter/material.dart';
import 'style/images.dart';
import 'package:gooey_carousel/gooey_carrousel.dart';
import 'widget/gooey_carousel.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  _GooeyEdgeDemoState createState() => _GooeyEdgeDemoState();
}

class _GooeyEdgeDemoState extends State<SecondScreen> {
  final controller = GooeyCarousel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GooeyCarousel(
            children: <Widget>[
              ContentCard(
                  image: AppImage.second_screen_image1,
                  altColor: const Color(0xFF4259B2),
                  subtitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis aliquam id id in pharetra lorem. Purus tortor velit sed consequat urna, ipsum. Sit nullam ultrices sed morbi sed. Et blandit commodo vel blandit praesent sed donec ultrices a. Vel, laoreet in et quam elit, sed viverra faucibus. Proin nisi amet urna purus vivamus felis cursus nulla.'),
              ContentCard(
                image: AppImage.second_screen_image2,
                altColor: const Color(0xFF904E93),
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis aliquam id id in pharetra lorem. Purus tortor velit sed consequat urna, ipsum. Sit nullam ultrices sed morbi sed. Et blandit commodo vel blandit praesent sed donec ultrices a. Vel, laoreet in et quam elit, sed viverra faucibus. Proin nisi amet urna purus vivamus felis cursus nulla. ',
              ),
              ContentCard(
                image: AppImage.second_screen_image3,
                altColor: const Color(0xFFFFB138),
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis aliquam id id in pharetra lorem. Purus tortor velit sed consequat urna, ipsum. Sit nullam ultrices sed morbi sed. Et blandit commodo vel blandit praesent sed donec ultrices a. Vel, laoreet in et quam elit, sed viverra faucibus. Proin nisi amet urna purus vivamus felis cursus nulla.',
              ),
            ],
          ),
          // Container(
          //   alignment: const Alignment(0, 0.55),
          //   child: AnimatedSmoothIndicator(
          //     activeIndex: controller.currentPage,
          //     count: 4,
          //     effect: WormEffect(
          //         spacing: 20,
          //         dotColor: StyleColor.color5050B1DE,
          //         activeDotColor: StyleColor.color59A4F2,
          //         dotWidth: 8,
          //         dotHeight: 8),
          //     onDotClicked: ((index) {
          //       controller.animateToPage(page: index);
          //     }),
          //   ),
          // )
        ],
      ),
    );
  }
}
