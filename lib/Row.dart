import 'package:calculator/Constants/constants.dart';
import 'package:flutter/material.dart';

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
            onPressed: () {},
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
            onPressed: () {},
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
            onPressed: () {},
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
            onPressed: () {},
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
  var list = ['ac', 'ce', '%', '÷', '×', '-', '+', '='];
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
