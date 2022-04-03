import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Random Image Game",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int leftImageNumber = 1;
  int rightImageNumber = 2;

  void changeImage() {
    setState(() {
      leftImageNumber = Random().nextInt(8) + 1;
      rightImageNumber = Random().nextInt(8) + 1;
    });
  }

  Widget viewImage(int imageNumber) {
    return Expanded(
        child: InkWell(
      onTap: () {
        changeImage();
      },
      child: Image.asset(
        "assets/images/image-$imageNumber.png",
        width: 150,
        height: 150,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables
        title: Row(children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/my_images.jpg'),
            radius: 24,
          ),
          const SizedBox(
            width: 60,
          ),
          const Text(
            "لعبة الصورة العشوائية",
            style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
          ),
        ]),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          Center(
            child: Expanded(
              child: Text(
                leftImageNumber == rightImageNumber
                    ? "لقد نجحت الصورتين متطابقتين"
                    : "حاول مرة اخرى",
                style: const TextStyle(
                    fontFamily: "Cairo",
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                softWrap: true,
              ),
            ),
          ),
          const SizedBox(
            height: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              viewImage(leftImageNumber),
              viewImage(rightImageNumber),
            ],
          )
        ],
      ),
    );
  }
}
