import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/text_styles.dart';

class AppReasons extends StatelessWidget {
  const AppReasons({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(
        Icons.fiber_manual_record,
        size: 4,
        color: StyleColor.color333333,
      ),
      label: Text(
        'Причина',
        style: TextStyles.SFProDisplay16x400,
      ),
    );
  }
}
