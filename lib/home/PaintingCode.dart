import 'dart:math';

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
      return [this, new Circle(this.offset, this.radius / 2, color)];
  }

  @override
  draw(Canvas canvas) {
    final paint = Paint();
    paint.color = this.color;
    canvas.drawCircle(this.offset, this.radius, paint);
  }
}

class Rectangle extends Shape {
  Rect rect;

  Rectangle(Rect rect, [Color color = Colors.blueAccent]) : super(SHAPES.square, color) {
    this.rect = rect;
  }

  @override
  Shape fromShape(Shape shape, [Color color = Colors.blueAccent]) {
    Rectangle newShape = super.fromShape(shape, color);
    newShape.rect = this.rect;
    return newShape;
  }

  Rectangle.fromLTRB(double left, double top, double right, double bottom, [Color color = Colors.blueAccent])
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
          Rectangle.fromLTRB(this.rect.left, this.rect.top, this.rect.right, center, this.color),
          Rectangle.fromLTRB(this.rect.left, center, this.rect.right, this.rect.bottom, color)
        ];

      case 1: // veritical
        double center = (rect.left + rect.right) / 2;
        return [
          Rectangle.fromLTRB(center, this.rect.top, this.rect.right, this.rect.bottom, this.color),
          Rectangle.fromLTRB(this.rect.left, this.rect.top, center, this.rect.bottom, color)
        ];

      case 2: // up diagonal
        Point LT = new Point(this.rect.left, this.rect.top);
        Point RT = new Point(this.rect.right, this.rect.top);
        Point RB = new Point(this.rect.right, this.rect.bottom);
        Point LB = new Point(this.rect.left, this.rect.bottom);
        return [Triangle.fromPoints(LT, RT, RB, this.color), Triangle.fromPoints(RB, LB, LT, color)];

      case 3:
      default: // down diagonal
        Point LT = new Point(this.rect.left, this.rect.top);
        Point RT = new Point(this.rect.right, this.rect.top);
        Point RB = new Point(this.rect.right, this.rect.bottom);
        Point LB = new Point(this.rect.left, this.rect.bottom);

        return [Triangle.fromPoints(RB, LB, RT, this.color), Triangle.fromPoints(RT, LT, LB, color)];
    }
  }

  @override
  draw(Canvas canvas) {
    final paint = Paint();
    paint.color = this.color;
    canvas.drawRect(this.rect, paint);
  }
}

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
      case 0:
        {
          p1 = 1;
          p2 = 2;
          p0 = 0;
          break;
        }
      case 1:
        {
          p1 = 1;
          p2 = 2;
          p0 = 0;
          break;
        }
      case 2:
      default:
        {
          p1 = 1;
          p2 = 2;
          p0 = 0;
          break;
        }
    }
    Point center = this.midpoint(this.points[p1], this.points[p2]);
    return [
      Triangle.fromPoints(this.points[p0], center, this.points[p1], this.color),
      Triangle.fromPoints(this.points[p0], center, this.points[p2], color)
    ];
  }

  @override
  draw(Canvas canvas) {
    final paint = Paint();
    paint.color = this.color;

    // create a path
    final Path path = Path();
    path.lineTo(this.points[0].x, this.points[0].y);
    path.lineTo(this.points[1].x, this.points[1].y);
    path.lineTo(this.points[2].x, this.points[2].y);
    path.close();

    canvas.drawPath(path, paint);
  }
}

class PaintingCode {
  List<Shape> shapes;
  List<Color> colors = [Colors.red, Colors.green, Colors.blue,
    Colors.yellow, Colors.pink, Colors.cyan,
    Colors.orange, Colors.purple, Colors.lime];

  PaintingCode(List<Shape> shapes) {
    this.shapes = shapes;
  }

  PaintingCode draw(Canvas canvas) {
    shapes.forEach((shape) => shape.draw(canvas));
  }

  List<Shape> splitShape(Shape shape, int direction, int color, int repeat) {
    // Shape newShape1 = new Shape.fromShape(shape);
    // Shape newShape2 = shape;
    if (shape.type == SHAPES.circle) {
      return (shape as Circle).splitCircle(direction % 2, colors[color]);
    }
    if (shape.type == SHAPES.triangle) {
      return (shape as Triangle).splitTriangle(direction % 3, colors[color]);
    }
    if (shape.type == SHAPES.square) {
      return (shape as Rectangle).splitRect(direction % 4, colors[color]);
    }
    return [shape];
  }

  // give three numbers, split the rectangle
  List<Shape> split(List<int> number) {
    int which = number[0] % this.shapes.length; // todo what to do if length > 9
    //int direction = number[1] % 4;
    int direction = (number[1] < 5) ? 0 : (number[1] < 8) ? 1: (number[1] < 9)? 2 : 3;
    int color = number[2] % 9;
    int repeat = number[3] % 2;

    // make a new list with all but the chosen shape
    List<Shape> shapes = this.shapes;
    Shape toSplit = shapes.removeAt(which);
    return [...shapes, ...splitShape(toSplit, direction, color, repeat)];
  }

  void makePainting(phone) {
    List digits = phone.split('');
    RegExp digitChars = new RegExp('[0-9]');

    digits = digits.where((digit) {
      return digitChars.firstMatch(digit) != null;
    }).map((digit) {
      return int.parse(digit);
    }).toList();
    int length = digits.length;
    digits.asMap().forEach((index, digit) {
      int number = digit;
      int color = digits[(index + 1) % length];
      int repeat = digits[(index + 2) % length];
      int which = digits[(index + 3) % length];
      this.shapes = this.split([number, color, repeat, which]);
    });
  }
}
