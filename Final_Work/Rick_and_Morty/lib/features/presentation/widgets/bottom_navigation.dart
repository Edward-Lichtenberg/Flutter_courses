import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/presentation/theme/assets_imag.dart';
//import 'package:rick_and_morty/features/presentation/cubit/cubit.dart';
import 'package:rick_and_morty/features/presentation/screens/option_screen.dart';
import 'package:rick_and_morty/features/presentation/theme/colors.dart';
import 'package:rick_and_morty/features/presentation/theme/text_styles.dart';
import 'package:rick_and_morty/features/presentation/theme/model/model_theme.dart';

import '../../data/cubit/main_cubit.dart';
import '../screens/characters_list.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key, required this.currentIndex}) : super(key: key);
  int currentIndex;
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Container(
        height: 65,
        color: themeNotifier.isDark
            ? const Color(0xff152A3A)
            : const Color(0xffFFFFFF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomNavigationItem(
              isDark: themeNotifier.isDark,
              icon: AppImages.characters,
              iconName: 'Персонажи',
              index: 0,
              currentIndex: widget.currentIndex,
              onTap: () {
                widget.currentIndex;
                setState(() {});
                BlocProvider.of<CharacterCubit>(context).getCharacter('');
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        const CharactersList(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
            ),
            _BottomNavigationItem(
              isDark: themeNotifier.isDark,
              icon: AppImages.locations,
              iconName: 'Локации',
              index: 1,
              currentIndex: widget.currentIndex,
              onTap: () {
                widget.currentIndex = 1;
                setState(() {});
              },
            ),
            _BottomNavigationItem(
              isDark: themeNotifier.isDark,
              icon: AppImages.episodes,
              iconName: 'Эпизоды',
              index: 2,
              currentIndex: widget.currentIndex,
              onTap: () {
                widget.currentIndex = 2;
                setState(() {});
              },
            ),
            _BottomNavigationItem(
              isDark: themeNotifier.isDark,
              icon: AppImages.settings,
              iconName: 'Настройки',
              index: 3,
              currentIndex: widget.currentIndex,
              onTap: () {
                widget.currentIndex = 3;
                setState(() {});
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        const OptionScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
            )
          ],
        ),
      );
    });
  }
}

class _BottomNavigationItem extends StatelessWidget {
  _BottomNavigationItem(
      {Key? key,
      required this.icon,
      required this.iconName,
      required this.onTap,
      required this.currentIndex,
      required this.index,
      required this.isDark})
      : super(key: key);
  final String icon;
  final String iconName;
  final int index;
  final int currentIndex;
  final Function() onTap;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(
              icon,
              color: index == currentIndex
                  ? isDark
                      ? AppColors.iconsActiveColor
                      : const Color(0xff22A2BD)
                  : isDark
                      ? AppColors.iconsNotActiveColor
                      : const Color(0xffBDBDBD),
            ),
          ),
          Text(
            iconName,
            style: AppText.Text14w400.copyWith(
              color: index == currentIndex
                  ? isDark
                      ? AppColors.iconsActiveColor
                      : const Color(0xff22A2BD)
                  : isDark
                      ? AppColors.iconsNotActiveColor
                      : const Color(0xffBDBDBD),
            ),
          )
        ],
      ),
    );
  }
}
