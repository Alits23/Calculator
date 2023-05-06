import 'package:calculator/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var text = '';
  String result = '';

  void buttonpressed(String box) {
    setState(() {
      text = text + box;
    });
  }

  Widget row(String box1, String box2, String box3, String box4) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // box 1
          SizedBox(
            height: getsizebox(box1),
            width: getsizebox(box1),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(width: 0, color: Colors.transparent),
                ),
                backgroundColor: getsahpecolor(box1),
              ),
              onPressed: () {
                setState(() {
                  if (box1 == 'ac') {
                    text = '';
                    result = '';
                  } else {
                    buttonpressed(box1);
                  }
                });
              },
              child: Text(
                box1,
                style: TextStyle(
                  fontSize: 26,
                  color: getcolorOperator(box1),
                ),
              ),
            ),
          ),

          // box 2
          SizedBox(
            height: getsizebox(box2),
            width: getsizebox(box2),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(width: 0, color: Colors.transparent),
                ),
                backgroundColor: getsahpecolor(box2),
              ),
              onPressed: () {
                setState(() {
                  if (box2 == 'ce' && text != '') {
                    text = text.substring(0, text.length - 1);
                  }
                  // این شرط برای اینکه اگه متن خالی بود ارور تکست لنگ نده که -1 شده
                  else if (box2 == 'ce' && text == '') {
                    text = '';
                  } else {
                    buttonpressed(box2);
                  }
                });
              },
              child: Text(
                box2,
                style: TextStyle(
                  fontSize: 26,
                  color: getcolorOperator(box2),
                ),
              ),
            ),
          ),

          // box 3
          SizedBox(
            height: getsizebox(box3),
            width: getsizebox(box3),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(width: 0, color: Colors.transparent),
                ),
                backgroundColor: getsahpecolor(box3),
              ),
              onPressed: () {
                buttonpressed(box3);
              },
              child: Text(
                box3,
                style: TextStyle(
                  fontSize: 26,
                  color: getcolorOperator(box3),
                ),
              ),
            ),
          ),

          // box 4
          SizedBox(
            height: getsizebox(box4),
            width: getsizebox(box4),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  ),
                ),
                backgroundColor: getsahpecolor(box4),
              ),
              onPressed: () {
                if (box4 == '=') {
                  Parser parser = Parser();
                  Expression expression = parser.parse(text);
                  ContextModel contextModel = ContextModel();
                  double eval =
                      expression.evaluate(EvaluationType.REAL, contextModel);
                  setState(() {
                    result = eval.toString();
                  });
                } else {
                  buttonpressed(box4);
                }
              },
              child: Text(
                box4,
                style: TextStyle(
                  fontSize: 26,
                  color: getcolorOperator(box4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool Operator(String text) {
    var list = ['ac', 'ce', '%', '/', '*', '-', '+', '='];
    for (var element in list) {
      if (text == element) {
        return true;
      }
    }
    return false;
  }

  Color getsahpecolor(String box) {
    if (Operator(box)) {
      return backgroundGreyDark;
    } else {
      return backgroundGrey;
    }
  }

  Color getcolorOperator(String box) {
    if (Operator(box)) {
      return textGreen;
    } else {
      return textGrey;
    }
  }

  double getsizebox(String box) {
    if (Operator(box)) {
      return 60;
    } else {
      return 60;
    }
  }

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 40, color: textGreen),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 2, right: 10, bottom: 10),
                      child: Text(
                        result,
                        style: TextStyle(
                          fontSize: 50,
                          color: textGrey,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    row('ac', 'ce', '%', '/'),
                    row('7', '8', '9', '*'),
                    row('4', '5', '6', '-'),
                    row('1', '2', '3', '+'),
                    row('00', '0', '.', '='),
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
