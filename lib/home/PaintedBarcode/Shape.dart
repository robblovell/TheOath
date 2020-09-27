import 'package:flutter/material.dart';

enum SHAPES { circle, triangle, square }

class Shape {
  SHAPES type;
  Color color = Colors.blueAccent;

  Shape(SHAPES type, [Color color = Colors.blueAccent]) {
    this.type = type;
    this.color = color;
  }

  double width() {
    return 10;
  }

  double height() {
    return 10;
  }

  double minSize() {
    return 100;
  }

  double maxSize() {
    return 10;
  }

  double incircleRadius() {
    return 10;
  }

  Offset center() {
    return Offset(0,0);
  }
  String toString() {
    return  "Color: "+this.color.value.toString();
  }
  draw(Canvas canvas) {}
}
