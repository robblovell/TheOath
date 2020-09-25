import 'dart:math';
import 'package:flutter/material.dart';

import 'Shape.dart';

class Triangle extends Shape {
  List<Point> points = List<Point>(3);

  Triangle(List<Point> point, [Color color = Colors.pinkAccent])
      : super(SHAPES.triangle, color) {
    this.points = point;
  }

  Triangle.fromPoints(Point p0, Point p1, Point p2,
      [Color color = Colors.pinkAccent])
      : super(SHAPES.triangle, color) {
    this.points[0] = p0;
    this.points[1] = p1;
    this.points[2] = p2;
  }

  @override
  List<Shape> split() {
    return [this, this];
  }

  double length(Point a, Point b) {
    return sqrt((b.x - a.x) * (b.x - a.x) + (b.y - a.y) * (b.y - a.y));
  }

  double minSize() {
    Point A = this.points[0];
    Point B = this.points[1];
    Point C = this.points[2];
    double c = length(A, B);
    double a = length(B, C);
    double b = length(C, A);
    double perimeter = a+b+c;
    double p = perimeter/2;

    double area = sqrt(p*(p-a)*(p-b)*(p-c));
    return 2*area/perimeter;
  }

  double incircleRadius() {
    Point A = this.points[0];
    Point B = this.points[1];
    Point C = this.points[2];
    double c = length(A, B);
    double a = length(B, C);
    double b = length(C, A);
    double perimeter = a+b+c;
    double p = perimeter/2;

    double area = sqrt(p*(p-a)*(p-b)*(p-c));
    return 2*area/perimeter;
  }

  Point inCenter() {
    Point A = this.points[0];
    Point B = this.points[1];
    Point C = this.points[2];
    double c = length(A, B);
    double a = length(B, C);
    double b = length(C, A);
    double divisor = a + b + c;
    return Point(
        (A.x*a + B.x*b + C.x*c) / divisor, (A.y*a + B.y*b + C.y*c) / divisor);
  }

  Offset center() {
    Point center = this.inCenter();
    return Offset(center.x, center.y);
  }

  Point naturalCenter() {
    return Point((points[0].x + points[1] .x + points[2].x)/3,
        (points[0].y + points[1] .y + points[2].y)/3);
  }

  Point midpoint(Point p0, Point p1) {
    return Point((p0.x + p1.x) / 2, (p0.y + p1.y) / 2);
  }

  List<Shape> splitTriangle(direction, [Color color = null]) {
    int p1, p2, p0;
    if (color == null) {
      color = this.color;
    }
    switch (direction) {
      case 0:
        p0 = 0;
        p1 = 1;
        p2 = 2;
        break;
      case 1:
        p0 = 2;
        p1 = 0;
        p2 = 1;
        break;
      case 2:
      default:
        p0 = 1;
        p1 = 2;
        p2 = 0;
        break;
    }
    Point center = this.midpoint(this.points[p1], this.points[p2]);
    return [
      Triangle.fromPoints(this.points[p0], center, this.points[p1], this.color),
      Triangle.fromPoints(this.points[p0], center, this.points[p2], color)
    ];
  }

  String toString() {
    return "Triangle[ " +
        this.points[0].toString() +
        ", " +
        this.points[1].toString() +
        ", " +
        this.points[2].toString() +
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
