import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String kMyHand = '✌️';
  String kComputerHand = '✊';
  String kResult = '引き分け';

  void selectHand(String selectedHand) {
    setState(() {
      kMyHand = selectedHand;
    });
    generateComputerHand();
    judge();
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    kComputerHand = randomNumberToHand(randomNumber);
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
    if (kComputerHand == kMyHand) {
      kResult = '引き分け';
    } else if (kMyHand == '✊' && kComputerHand == '✌️' ||
        kMyHand == '✌️' && kComputerHand == '✋' ||
        kMyHand == '✋' && kComputerHand == '✊') {
      kResult = '勝ち';
    } else {
      kResult = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              kResult,
              style: const TextStyle(
                fontSize: 32.0,
              ),
            ),
            const SizedBox(
              height: 64.0,
            ),
            Text(
              kComputerHand,
              style: const TextStyle(
                fontSize: 32.0,
              ),
            ),
            const SizedBox(
              height: 64.0,
            ),
            Text(
              kMyHand,
              style: const TextStyle(
                fontSize: 32.0,
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand('✊');
                  },
                  child: const Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✌️');
                  },
                  child: const Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✋');
                  },
                  child: const Text('✋'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
