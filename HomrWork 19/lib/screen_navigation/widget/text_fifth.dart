import 'package:flutter/material.dart';

import '../style/text_styles.dart';

class TextFields extends StatelessWidget {
  const TextFields({
    Key? key,
    required this.text,
    required this.textFieldText,
    required this.actionKeyboardButton,
  }) : super(key: key);

  final String text;
  final String textFieldText;
  final TextInputAction actionKeyboardButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextStyles.SFProDisplay21x600),
        const SizedBox(height: 5),
        TextField(
            decoration: InputDecoration(
                hintText: textFieldText,
                hintStyle: TextStyles.SFProDisplay16x400),
            textInputAction: actionKeyboardButton),
      ],
    );
  }
}
