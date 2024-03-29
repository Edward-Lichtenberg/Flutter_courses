//Использовали MaterialApp, Scaffold, AppBar, Text, Padding, Column, Row, Container
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Home Work',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Flutter Home Work'),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Cubes(),
      backgroundColor: const Color.fromARGB(255, 162, 223, 252),
    );
  }
}

class Cubes extends StatelessWidget {
  const Cubes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [MyWidget()],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [MyWidget()],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [MyWidget()],
        ),
      ]),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          width: 75,
          height: 75,
          color: Colors.red,
          child: const Text(
            '1',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          color: Colors.yellow,
          child: const Text(
            '2',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 120,
          height: 120,
          color: Colors.green,
          child: const Text(
            '3',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ]),
    );
  }
}
