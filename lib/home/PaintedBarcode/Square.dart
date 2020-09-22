import 'dart:math';
import 'package:flutter/material.dart';

import 'Triangle.dart';
import 'Shape.dart';
class Square extends Shape {
  Rect rect;

  Square(Rect rect, [Color color = Colors.blueAccent]) : super(SHAPES.square, color) {
    this.rect = rect;
  }

  // @override
  // Shape fromShape(Shape shape, [Color color = Colors.blueAccent]) {
  //   Square newShape = super.fromShape(shape, color) as Square;
  //   newShape.rect = this.rect;
  //   return newShape;
  // }

  Square.fromLTRB(double left, double top, double right, double bottom, [Color color = Colors.blueAccent])
      : super(SHAPES.square, color) {
    this.rect = Rect.fromLTRB(left, top, right, bottom);
  }

  List<Shape> splitRect(int direction, [Color color = null]) {
    if (color == null) {
      color = this.color;
    }
    switch (direction) {
      case 0: // horizontal
        double center = (rect.top + rect.bottom) / 2;
        return [
          Square.fromLTRB(this.rect.left, this.rect.top, this.rect.right, center, this.color),
          Square.fromLTRB(this.rect.left, center, this.rect.right, this.rect.bottom, color)
        ];

      case 1: // veritical
        double center = (rect.left + rect.right) / 2;
        return [
          Square.fromLTRB(center, this.rect.top, this.rect.right, this.rect.bottom, this.color),
          Square.fromLTRB(this.rect.left, this.rect.top, center, this.rect.bottom, color)
        ];

      case 2: // up diagonal
        Point LT = Point(this.rect.left, this.rect.top);
        Point RT = Point(this.rect.right, this.rect.top);
        Point RB = Point(this.rect.right, this.rect.bottom);
        Point LB = Point(this.rect.left, this.rect.bottom);
        return [Triangle.fromPoints(LT, RT, RB, this.color), Triangle.fromPoints(RB, LB, LT, color)];

      case 3:
      default: // down diagonal
        Point LT = Point(this.rect.left, this.rect.top);
        Point RT = Point(this.rect.right, this.rect.top);
        Point RB = Point(this.rect.right, this.rect.bottom);
        Point LB = Point(this.rect.left, this.rect.bottom);

        return [Triangle.fromPoints(RB, LB, RT, this.color), Triangle.fromPoints(RT, LT, RB, color)];
    }
  }
  String toString() {
    return "Square[ " + this.rect.toString() +  " ]\n";
  }
  @override
  draw(Canvas canvas) {
    final paint = Paint();
    paint.color = this.color;
    canvas.drawRect(this.rect, paint);
  }
}

