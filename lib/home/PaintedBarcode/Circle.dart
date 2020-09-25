import 'package:flutter/material.dart';

import 'Shape.dart';

class Circle extends Shape {
  Offset offset;
  double radius;

  Circle(Offset offset, double radius, [Color color = Colors.amberAccent])
      : super(SHAPES.circle, color) {
    this.offset = offset;
    this.radius = radius;
  }

  @override Offset center() {
    return this.offset;
  }

  @override double minSize() {
    return this.radius/2;
  }

  @override
  Circle.fromShape(Shape shape, [Color color = Colors.blueAccent])
      : super(SHAPES.circle, color){
    this.offset = shape.center(); //Offset(shape.center().x, shape.center().y);
    this.radius = shape.incircleRadius();
  }

  List<Shape> splitCircle(int direction, Color color) {
    if (color == null) {
      color = this.color;
    }
    if (direction == 0) {
      return [this];
    } else {
      return [this, Circle(this.offset, this.radius / 2, color)];
    }
  }

  String toString() {
    return "Circle[ " + this.offset.toString() + ", " + this.radius.toString() + ", " + super.toString() + " ]\n";
  }

  @override
  draw(Canvas canvas) {
    final paint = Paint();
    paint.color = this.color;
    canvas.drawCircle(this.offset, this.radius, paint);
  }
}
