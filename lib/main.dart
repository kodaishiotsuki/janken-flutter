import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
    );
  }
}

//statefull widget
class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '✊';
  String comHand = '✊';
  String result = '引き分け';

  void selectHand(String selectedHand) {
    //自分の手
    myHand = selectedHand;
    //相手の手
    generateComHand();
    //結果
    judge();
    setState(() {}); //画面を更新
  }

  void generateComHand() {
    final randomNumber = Random().nextInt(3);
    comHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌️';
      case 2:
        return '✋';
      default:
        return '✊';
    }
  }

  void judge() {
    if (comHand == myHand) {
      result = 'draw';
    } else if (myHand == '✊' && comHand == '✌️' ||
        myHand == '✌️' && comHand == '✋' ||
        myHand == '✋' && comHand == '✊') {
      result = 'win';
    } else {
      result = 'lose';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Janken'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(
              height: 64,
            ),
            Text(
              comHand,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(
              height: 64,
            ),
            Text(
              myHand,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand('✊');
                  },
                  child: Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✌️');
                  },
                  child: Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✋');
                  },
                  child: Text('✋'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
