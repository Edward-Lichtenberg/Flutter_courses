// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty/features/presentation/theme/assets_imag.dart';
import 'package:rick_and_morty/features/presentation/theme/colors.dart';
import 'package:rick_and_morty/features/presentation/theme/text_styles.dart';
import 'package:rick_and_morty/features/presentation/widgets/bottom_navigation.dart';
import 'package:rick_and_morty/features/presentation/theme/model/model_theme.dart';

import 'user_page/mode/user_pferences.dart';
import 'user_page/profil_screen.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({Key? key}) : super(key: key);

  // await UserPferences.init();
  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

// for button
Future build() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPferences.init();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const SizedBox(),
        ),
        bottomNavigationBar: BottomNavigation(
          currentIndex: 3,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: (() async {
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfilUser()));
                    }),
                    child: Text('Profile'));
              }),
              // ProfilUser(),
              Divider(
                color: themeNotifier.isDark
                    ? const Color(0xff152A3A)
                    : const Color(0xffE5E5E5),
                thickness: 2,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Theme style',
                style: AppText.Text14w400.copyWith(color: AppColors.cardInfo),
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(AppImages.theme,
                        color: themeNotifier.isDark
                            ? const Color(0xffFFFFFF)
                            : const Color(0xff0B1E2D)),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Dark theme',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          themeNotifier.isDark ? 'Turned on' : 'Turned off',
                          style: const TextStyle(color: Color(0xff6E798C)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      themeNotifier.isDark
                          ? Icons.nightlight_round
                          : Icons.wb_sunny,
                      color: themeNotifier.isDark
                          ? const Color(0xffFFFFFF)
                          : const Color(0xff0B1E2D),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Divider(
                color: themeNotifier.isDark
                    ? const Color(0xff152A3A)
                    : const Color(0xffE5E5E5),
                thickness: 2,
              ),
              SizedBox(height: 40),
              Text(
                'Application Version',
                style: AppText.Text14w400.copyWith(color: AppColors.cardInfo),
              ),
              SizedBox(height: 20),
              Text(
                'Rick & Morty  v0.1.0',
                style: AppText.Text16w500,
              )
            ],
          ),
        ),
      );
    });
  }
}
