import 'package:flutter/material.dart';

import 'Shape.dart';

class Circle extends Shape {
  Offset offset;
  double radius;

  Circle(Offset offset, double radius, [Color color = Colors.amberAccent]) : super(SHAPES.circle, color) {
    this.offset = offset;
    this.radius = radius;
  }

  @override
  Shape fromShape(Shape shape, [Color color = Colors.blueAccent]) {
    Circle newShape = super.fromShape(shape, color);
    newShape.offset = this.offset;
    newShape.radius = this.radius;
    return newShape;
  }

  List<Shape> splitCircle(int direction, [Color color = null]) {
    if (color == null) {
      color = this.color;
    }
    if (direction == 0)
      return [this];
    else
      return [this, Circle(this.offset, this.radius / 2, color)];
  }

  @override
  draw(Canvas canvas) {
    final paint = Paint();
    paint.color = this.color;
    canvas.drawCircle(this.offset, this.radius, paint);
  }
}

