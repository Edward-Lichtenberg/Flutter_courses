import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/scheduler.dart';
import 'package:flutter__lesson_15_hw/screen_navigation/style/colors.dart';
import 'package:flutter__lesson_15_hw/screen_navigation/style/text_styles.dart';

import '../third_screen.dart';

class ContentCard extends StatefulWidget {
  final String image;
  final Color altColor;
  // final String title;
  final String subtitle;

  const ContentCard(
      {super.key,
      required this.altColor,
      required this.subtitle,
      required this.image});

  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  late Ticker _ticker;

  @override
  void initState() {
    _ticker = Ticker((d) {
      setState(() {});
    })
      ..start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var time = DateTime.now().millisecondsSinceEpoch / 2000;
    var scaleX = 1.2 + sin(time) * .05;
    var scaleY = 1.2 + cos(time) * .07;
    var offsetY = 20 + cos(time) * 20;
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: <Widget>[
        Transform(
          transform: Matrix4.diagonal3Values(scaleX, scaleY, 1),
          child: Transform.translate(
            offset: Offset(-(scaleX - 1) / 2 * size.width,
                -(scaleY - 1) / 2 * size.height + offsetY),
            // child: Image.asset(widget.image),
          ),
        ),
        Container(
          color: StyleColor.colorE5E5E5B,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 75.0, bottom: 25.0),
            child: Column(
              children: <Widget>[
                //Top Image
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Image.asset(widget.image),
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  widget.subtitle,
                  style: TextStyles.SFProDisplay16x400,
                  textAlign: TextAlign.center,
                ),
                // //Slider circles
                SizedBox(height: 50, child: Image.asset(widget.image)),

                //Bottom content
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: _buildBottomContent(),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBottomContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // Text(widget.subtitle,
        //     textAlign: TextAlign.center,
        //     style: const TextStyle(
        //         fontSize: 14.0,
        //         fontWeight: FontWeight.w300,
        //         fontFamily: 'OpenSans',
        //         color: Color.fromARGB(255, 226, 11, 11))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              color: widget.altColor,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Get Started',
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: .8,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const ThirdScreen();
                  },
                ), (route) => false);
              }),
        )
      ],
    );
  }
}
