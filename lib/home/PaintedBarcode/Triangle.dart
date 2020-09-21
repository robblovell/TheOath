import 'dart:math';
import 'package:flutter/material.dart';

import 'Shape.dart';

class Triangle extends Shape {
  List<Point> points = new List<Point>(3);

  Triangle(List<Point> point, [Color color = Colors.pinkAccent]) : super(SHAPES.triangle, color) {
    this.points = point;
  }

  Triangle.fromPoints(Point p0, Point p1, Point p2, [Color color = Colors.pinkAccent]) : super(SHAPES.triangle, color) {
    this.points[0] = p0;
    this.points[1] = p1;
    this.points[2] = p2;
  }

  @override
  Shape fromShape(Shape shape, [Color color = Colors.blueAccent]) {
    Triangle newShape = super.fromShape(shape, color);
    newShape.points = this.points;
    return newShape;
  }

  @override
  List<Shape> split() {
    return [this, this];
  }

  Point midpoint(Point p0, Point p1) {
    return new Point((p0.x + p1.x) / 2, (p0.y + p1.y) / 2);
  }

  List<Shape> splitTriangle(direction, [Color color = null]) {
    int p1, p2, p0;
    if (color == null) {
      color = this.color;
    }
    switch (direction) {
      case 0: p0 = 0; p1 = 1; p2 = 2; break;
      case 1: p0 = 2; p1 = 0; p2 = 1; break;
      case 2:
      default: p0 = 1; p1 = 2; p2 = 0; break;
    }
    Point center = this.midpoint(this.points[p1], this.points[p2]);
    return [
      Triangle.fromPoints(this.points[p0], center, this.points[p1], this.color),
      Triangle.fromPoints(this.points[p0], center, this.points[p2], color)
    ];
  }
  String toString() {
    return "Triangle[ "+
        this.points[0].toString()+ ", " +
        this.points[1].toString() + ", "+
        this.points[2].toString()+
        " ]\n";
  }

  @override
  draw(Canvas canvas) {
    final paint = Paint();
    paint.color = this.color;

    // create a path
    final Path path = Path();
    path.moveTo(this.points[0].x, this.points[0].y);
    path.lineTo(this.points[1].x, this.points[1].y);
    path.lineTo(this.points[2].x, this.points[2].y);
    path.close();

    canvas.drawPath(path, paint);
  }
}