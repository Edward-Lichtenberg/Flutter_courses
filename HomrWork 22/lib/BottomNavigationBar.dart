import 'package:flutter/material.dart';

import 'content/images.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> get _widgetOptions => <Widget>[
        const Text('Персонажи - 0', style: optionStyle),
        const Text('Локации не найдены', style: optionStyle),
        const Text('Эпизоды - 0', style: optionStyle),
        const Text('В ближайшем будущем', style: optionStyle),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//*BottomNavigationBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 44,
        //showSelectedLabels: true,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset(AppImages.avatar, height: 35),
              label: 'Персонажи',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.hot, height: 35),
            label: 'Локации',
            backgroundColor: Colors.indigo,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Эпизоды',
            backgroundColor: Colors.purple,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff43D049),
        onTap: _onItemTapped,
      ),
    );
  }
}
