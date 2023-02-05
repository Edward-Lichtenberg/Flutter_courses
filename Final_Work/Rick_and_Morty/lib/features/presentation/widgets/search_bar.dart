import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/presentation/theme/assets_imag.dart';
import 'package:rick_and_morty/features/presentation/theme/colors.dart';
import 'package:rick_and_morty/features/presentation/theme/text_styles.dart';
import 'package:rick_and_morty/features/presentation/theme/model/model_theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.onChanged, required this.onTap})
      : super(key: key);

  final Function(String name) onChanged;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: themeNotifier.isDark
              ? const Color(0xff152A3A)
              : const Color(0xffE5E5E5),
        ),
        width: double.infinity,
        height: 48,
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(AppImages.search),
          ),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Найти персонажа',
                hintStyle:
                    AppText.Text16w400.copyWith(color: AppColors.color5B6975),
              ),
            ),
          ),
          SizedBox(
            height: 25,
            child: VerticalDivider(
              color: Colors.white.withOpacity(0.2),
              thickness: 1,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Image.asset(AppImages.filter),
            ),
          ),
        ]),
      );
    });
  }
}
