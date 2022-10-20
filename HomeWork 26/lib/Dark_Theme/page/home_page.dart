part of '../main.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../main.dart';
// import '../provider/theme_provider.dart';
// import '../widget/change_theme_button_widget.dart';

// import 'package:theme_example/main.dart';
// import 'package:theme_example/page/profile_widget.dart';
// import 'package:theme_example/provider/theme_provider.dart';
// import 'package:theme_example/widget/change_theme_button_widget.dart';
// import 'navigationbar_widget.dart';

class _HomePage extends StatelessWidget {
  const _HomePage();

  // @override
  // Widget build(BuildContext context) => Scaffold(
  //       appBar: AppBar(
  //         iconTheme: Theme.of(context).iconTheme,
  //         backgroundColor: Colors.transparent,
  //         leading: Icon(Icons.menu),
  //         title: Text(MyApp.title),
  //         elevation: 0,
  //         actions: [
  //           ChangeThemeButtonWidget(),
  //         ],
  //       ),
  //       body: ProfileWidget(),
  //       extendBody: true,
  //       bottomNavigationBar: NavigationBarWidget(),
  //     );

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';

    final lightColorsOfGrid = [
      const Color(0xffCD5C5C),
      const Color(0xffFFD700),
      const Color(0xff00FF00),
      const Color(0xffFFC0CB),
      const Color(0xff9370DB),
      const Color(0xff00BFFF),
      const Color(0xff778899),
      const Color(0xffE667AF),
      const Color(0xff4f69c6)
    ];

    final darkColorsOfGrid = [
      const Color(0xff8B0000),
      const Color(0xffFF8C00),
      const Color(0xff006400),
      const Color(0xffC71585),
      const Color(0xff483D8B),
      const Color(0xff2F4F4F),
      const Color(0xff85004B),
      const Color(0xff0000FF),
      const Color(0xff4b0082)
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(MyApp.title),
        actions: const [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Hello $text!',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            reverse: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount:
                Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
                    ? lightColorsOfGrid.length
                    : darkColorsOfGrid.length,
            itemBuilder: (context, index) => _GridOfColors(
              colorName: Provider.of<ThemeProvider>(context).themeMode ==
                      ThemeMode.light
                  ? lightColorsOfGrid[index]
                  : darkColorsOfGrid[index],
            ),
          ),
        ],
      ),
    );
  }
}

class _GridOfColors extends StatelessWidget {
  const _GridOfColors({
    Key? key,
    required this.colorName,
  }) : super(key: key);

  final Color colorName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorName,
    );
  }
}
