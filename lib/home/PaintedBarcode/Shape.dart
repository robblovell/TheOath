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

  draw(Canvas canvas) {}
}

