import 'package:flutter/material.dart';
import '../style/colors.dart';

class AppButtonBlue extends StatelessWidget {
  const AppButtonBlue({
    Key? key,
    required this.onPress,
    required this.text,
    required this.style,
    //required this.color,
  }) : super(key: key);

  final void Function()? onPress;
  final String text;
  final TextStyle style;
  //final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          backgroundColor: StyleColor.color59A4F2,
          minimumSize: const Size(double.infinity, 49),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          elevation: 0),
      //child: Container(
      //color: StyleColor.colorFFFFFF,
      child: Text(
        text.toUpperCase(),
        style: style,
        textAlign: TextAlign.center,
      ),
      //),
    );
  }
}

class AppButtonRed extends StatelessWidget {
  const AppButtonRed({
    Key? key,
    required this.onPress,
    required this.text,
    required this.style,
  }) : super(key: key);

  final void Function()? onPress;
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: StyleColor.colorF1564A,
        minimumSize: const Size(159, 49),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
      ),
      child: Text(
        text.toUpperCase(),
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }
}
