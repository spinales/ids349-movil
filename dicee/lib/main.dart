import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftDice = 1;

  void changeImage() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text('Dice App'),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      changeImage();
                    },
                    child: Image.asset('images/dice$leftDice.png')),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      changeImage();
                    },
                    child: Image.asset('images/dice$leftDice.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}