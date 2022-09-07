import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Button animation',
      home: ButtonAnimation(),
    );
  }
}

class ButtonAnimation extends StatefulWidget {
  const ButtonAnimation({Key? key}) : super(key: key);
  @override
  State<ButtonAnimation> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ButtonAnimation> {
  List<String> names = ['Vivian', 'Jaquan', 'Kaleb', 'Gino', 'Ervin', 'Darren'];
  String nameValue = 'Vivian';
  bool isCheckActive = false;
  bool isSwitchActive = true;
  final random = Random();
  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 143, 230, 140),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.black,
        label: const Text('search'),
        icon: const Icon(Icons.search),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              //Кнопка листовой список
              DropdownButton<String>(
                value: nameValue,
                //focusColor: Color.fromARGB(255, 238, 11, 3),
                // iconEnabledColor: const Color.fromARGB(255, 238, 3, 3),
                // focusColor: const Color.fromARGB(255, 238, 3, 3),
                // dropdownColor: const Color.fromARGB(255, 6, 23, 82),
                items: [
                  ...names.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                ],
                onChanged: (name) {
                  nameValue = name ?? '';
                  //email.text = name ?? '';
                  setState(() {});
                },
              ),
              // Кпока галочка(флажок)
              Checkbox(
                value: isCheckActive,
                onChanged: (value) {
                  isCheckActive = !isCheckActive;
                  setState(() {});
                },
                activeColor: Color.fromARGB(255, 248, 53, 190),
                checkColor: Colors.black,
              ),
              //Кнопка Вкл/Выкл
              Platform.isAndroid
                  ? Switch(
                      value: isSwitchActive,
                      activeColor: const Color.fromARGB(255, 238, 3, 167),
                      onChanged: (value) {
                        isSwitchActive = value;
                        setState(() {});
                      })
                  : CupertinoSwitch(
                      value: isSwitchActive,
                      activeColor: const Color.fromARGB(255, 238, 3, 167),
                      onChanged: (value) {
                        isSwitchActive = value;
                        setState(() {});
                      }),
              if (isSwitchActive)
                Center(
                  child: AnimatedContainer(
                    height: random.nextDouble() * 250,
                    width: random.nextDouble() * 250,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(random.nextInt(500),
                          random.nextInt(500), random.nextInt(500), 1),
                      borderRadius: _borderRadius,
                    ),
                    duration: const Duration(seconds: 7), //Длительность смены
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
