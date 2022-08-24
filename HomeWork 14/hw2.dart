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
      title: 'List Viev',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const ListV(),
    );
  }
}

class ListV extends StatelessWidget {
  const ListV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 138, 138, 138),
        appBar: AppBar(
          title: const Center(
            child: Text('Flutter Home Work 2'),
          ),
          backgroundColor: Colors.blue,
        ),
        body: const Content());
  }
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'images/dart1.png',
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              //width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 10,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 10, 13, 214),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  children: [
                    Row(children: const [
                      Bottom(),
                      SizedBox(
                        width: 10,
                      ),
                      Bottom(),
                      SizedBox(
                        width: 10,
                      ),
                      Bottom(),
                      SizedBox(
                        width: 10,
                      ),
                      Bottom(),
                      SizedBox(
                        width: 10,
                      ),
                      Bottom(),
                      SizedBox(
                        width: 10,
                      ),
                      Bottom(),
                      SizedBox(
                        width: 10,
                      ),
                      Bottom(),
                      SizedBox(
                        width: 10,
                      )
                    ]),
                  ]),
            ),
          ],
        )
      ],
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.green, Colors.red]),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: const [
          Text(
            '+',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            'Add',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
