import 'package:flutter/material.dart';

import 'Circle.dart';
import 'Triangle.dart';
import 'Square.dart';
import 'Shape.dart';

class PaintedBarcode {
  List<Object> shapes;
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.purple,
    Colors.cyan,
    Colors.teal,
    Colors.orange,
    Colors.indigo,
  ];
  List<Color> alt_colors = [
    Colors.redAccent[100],
    Colors.greenAccent[200],
    Colors.indigoAccent[100],
    Colors.yellowAccent[100],
    Colors.pink[100],
    Colors.cyanAccent[100],
    Colors.lightGreenAccent[200],
    Colors.deepOrange,
    Colors.orangeAccent[100],
    Colors.indigo[300],
  ];
  List<Color> alt_alt_colors = [
    Colors.blueGrey,
    Colors.brown,
    Colors.lime,
    Colors.grey[400],
    Colors.grey[500],
    Colors.grey[600],
    Colors.grey[700],
    Colors.grey[800],
    Colors.grey[900],
  ];

  PaintedBarcode(List<Object> shapes) {
    this.shapes = shapes;
  }

  List<Object> shapeShape(Shape shape, int direction, Color color, int repeat) {
    if (shape.type == SHAPES.circle) {
      return (shape as Circle).splitCircle(direction % 2, color);
    }
    if (shape.type == SHAPES.triangle) {
      return (shape as Triangle).splitTriangle(direction % 3, color);
    }
    if (shape.type == SHAPES.square) {
      return (shape as Square).splitRect(direction % 4, color);
    }
    return [shape] as List<Object>;
  }

  List<Object> spread(List<Object> thisList) {
    List<Object> value = [] as List<Object>;
    thisList.forEach((element) {
      if (element is Shape) {
        value.add(element);
      } else {
        value.add(this.spread(element));
      }
    });
    return value;
  }

  // give three numbers, shape the rectangle
  List<Object> split(
      shapeList, int which, int direction, Color color, int repeat) {
    List<Object> shapes = shapeList;
    Shape toSplit = shapes.removeAt(which);
    return [...shapes, ...shapeShape(toSplit, direction, color, repeat)];
  }

  void makePainting(phone, width, height) {

    List digits = phone.split('');
    RegExp digitChars = RegExp('[0-9]');

    digits = digits.where((digit) {
      return digitChars.firstMatch(digit) != null;
    }).map((digit) {
      return int.parse(digit);
    }).toList();
    int length = digits.length;
    final Rect rect = Rect.fromLTWH(0, 0, width, height);
    int colorIndex = digits[(digits[0]) % length] % this.alt_alt_colors.length;
    Color colorBase = this.alt_alt_colors[colorIndex];
    this.shapes.add(Square(rect, colorBase));
    List<int> used = [];
    List<int> used2 = [];
    digits.asMap().forEach((index, digit) {
      int digitOb = (digit).toInt() % 10;
      int direction = 0;
      direction = (digitOb < 4)
          ? 1 // vertical
          : (digitOb < 8)
              ? 0 // horizontal
              : (digitOb < 9)
                  ? 2
                  : 3;

      int colorIndex = digits[(index + 2) % length] % this.colors.length;
      Color color = this.colors[colorIndex];
      if (used.contains(colorIndex)) {
        int colorIndex2 = index%this.alt_colors.length;
        color = this.alt_colors[colorIndex2];
        if (used2.contains(colorIndex2)) {
          int colorIndex3 = (index+1)%this.alt_alt_colors.length;
          color = this.alt_alt_colors[colorIndex3];
        }
        used2.add(colorIndex2);
      }
      used.add(colorIndex);
      int repeat = digits[(index + 2) % length] % 2;
      int which =
          digits[(index + 3) % length] % [this.spread(this.shapes)].length;
      this.shapes = this.split(this.shapes, which, direction, color, repeat);
    });
    used = [];
    used2 = [];
    digits.asMap().forEach((index, digit) {
      if (digit == 0 || digit == 3) {
        int colorIndex = digits[(index+9) % length] % this.colors.length;
        Color color = this.colors[colorIndex%this.colors.length];
        if (used.contains(colorIndex)) {
          int colorIndex2 = (index+3)%this.alt_colors.length;
          color = this.alt_colors[colorIndex2];
          if (used2.contains(colorIndex2)) {
            int colorIndex3 = (index+4)%this.alt_alt_colors.length;
            color = this.alt_alt_colors[colorIndex3];
          }
          used2.add(colorIndex2);
        }
        used.add(colorIndex);
        this.shapes.add(Circle.fromShape(this.shapes[index], color));
      }
    });
  }

  arrayDraw(Canvas canvas, List<Object> shapes) {
    shapes.forEach((shape) {
      if (shape is List<Object>) {
        this.arrayDraw(canvas, shape as List<Object>);
      } else {
        (shape as Shape).draw(canvas);
      }
    });
  }

  String toString() {
    String value = "<" + shapes.first.toString();
    shapes.skip(1).forEach((element) {
      value = value + ", " + element.toString();
    });
    return value + ">";
  }

  void draw(Canvas canvas) {
    this.arrayDraw(canvas, this.shapes);
  }
}
