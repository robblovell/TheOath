import 'dart:math';
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

  // give three numbers, split the rectangle
  List<Shape> split(int which, int direction, int color, int repeat) {
    // direction = 3; //2+direction%1+1;
    // make a new list with all but the chosen shape
    List<Shape> shapes = this.shapes;
    print("remove: "+which.toString()+" length"+shapes.length.toString());
    Shape toSplit = shapes.removeAt(which);
    print("To Split:" + toSplit.toString());
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
      int direction = digit%4; //(digit < 5) ? 0 : (digit < 8) ? 1: (digit < 9)? 2 : 3;
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
