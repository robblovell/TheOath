import 'package:flutter/material.dart';

enum SHAPES { circle, triangle, square }

class Shape {
  SHAPES type;
  Color color = Colors.blueAccent;

  Shape(SHAPES type, [Color color = Colors.blueAccent]) {
    this.type = type;
    this.color = color;
  }

  Shape fromShape(Shape shape, [Color color = Colors.blueAccent]) {
    Shape newShape = new Shape(shape.type, color);
    return newShape;
  }

  List<Shape> split() {
    return [this.fromShape(this, this.color)];
  }

  double width () {
    return 10;
  }
  double height () {
    return 10;
  }
  double minSize () {
    return 100;
  }
  double maxSize () {
    return 10;
  }
  Offset center() {
    return new Offset(100,100);
  }

  draw(Canvas canvas) {}
}

