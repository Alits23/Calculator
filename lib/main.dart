import 'package:calculator/Constants/constants.dart';
import 'package:flutter/material.dart';

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
                height: 100,
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: backgroundGrey,
                height: 200,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
