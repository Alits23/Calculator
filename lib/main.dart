import 'package:calculator/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'Row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: backgroundGreyDark,
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    row('ac', 'ce', '%', '÷'),
                    row('7', '8', '9', '×'),
                    row('4', '5', '6', '-'),
                    row('1', '2', '3', '+'),
                    row('00', '0', '∙', '='),
                  ],
                ),
                color: backgroundGrey,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
