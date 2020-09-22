import 'package:flutter/material.dart';

import 'Circle.dart';
import 'Triangle.dart';
import 'Square.dart';
import 'Shape.dart';

class PaintedBarcode {
  List<Shape> shapes;
  List<Color> colors = [Colors.red, Colors.green, Colors.blue,
    Colors.yellow, Colors.pink, Colors.cyan,
    Colors.orange, Colors.purple, Colors.lime];

  PaintedBarcode(List<Shape> shapes) {
    this.shapes = shapes;
  }

  PaintedBarcode draw(Canvas canvas) {
    shapes.forEach((shape) => shape.draw(canvas));
  }

  List<Shape> splitShape(Shape shape, int direction, int color, int repeat) {
    if (shape.type == SHAPES.circle) {
      return (shape as Circle).splitCircle(direction % 2, colors[color]);
    }
    if (shape.type == SHAPES.triangle) {
      return (shape as Triangle).splitTriangle(direction % 3, colors[color]);
    }
    if (shape.type == SHAPES.square) {
      return (shape as Square).splitRect(direction % 4, colors[color]);
    }
    return [shape];
  }

  Shape makeInsideShape(Shape shape, int color, int repeat) {

  }

  // give three numbers, split the rectangle
  List<Shape> split(int which, int direction, int color, int repeat) {
    List<Shape> shapes = this.shapes;

    if (direction == 0) {
      Shape toOverlay = shapes[which];
      Offset offset = toOverlay.center();
      double radius = toOverlay.minSize();
      Circle circle = Circle(offset, radius, colors[color]);
      return [...shapes, circle];
    }
    else {
      print("remove: "+which.toString()+" length"+shapes.length.toString());
      Shape toSplit = shapes.removeAt(which);
      print("To Split:" + toSplit.toString());
      return [...shapes, ...splitShape(toSplit, direction, color, repeat)];
    }
  }

  void makePainting(phone) {
    List digits = phone.split('');
    RegExp digitChars = RegExp('[0-9]');

    digits = digits.where((digit) {
      return digitChars.firstMatch(digit) != null;
    }).map((digit) {
      return int.parse(digit);
    }).toList();
    int length = digits.length;
    digits.asMap().forEach((index, digit) {
      int direction = digit%3;
      direction = (digit < 3) ? 1 : (digit < 7) ? 0: (digit < 8)? 2 : 3;
      int color = digits[(index + 1) % length]%9;
      int repeat = digits[(index + 2) % length]%2;
      int which = digits[(index + 3) % length]%this.shapes.length;
      print("remove-: "+which.toString()+" length"+length.toString());
      print ("Before: "+this.shapes.toString());
      this.shapes = this.split(which, direction, color, repeat);
      print ("After: "+this.shapes.toString());
      print("---------------------------------");
    });
  }
}
