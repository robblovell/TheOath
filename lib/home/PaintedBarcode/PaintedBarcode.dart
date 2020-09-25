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
    Colors.cyan,
    Colors.purple,
    Colors.orange,
    Colors.lightGreenAccent,
    Colors.tealAccent,
  ];
  List<Color> alt_colors = [
    Colors.redAccent[100],
    Colors.greenAccent[100],
    Colors.indigoAccent[100],
    Colors.yellowAccent[100],
    Colors.pink[100],
    Colors.cyanAccent[100],
    Colors.purpleAccent[100],
    Colors.orangeAccent[100],
    Colors.lightGreenAccent[100],
    Colors.tealAccent[100],
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

  void makePainting(phone) {
    List digits = phone.split('');
    RegExp digitChars = RegExp('[0-9]');

    digits = digits.where((digit) {
      return digitChars.firstMatch(digit) != null;
    }).map((digit) {
      return int.parse(digit);
    }).toList();
    int length = digits.length;
    List<int> used = [];
    digits.asMap().forEach((index, digit) {
      int direction = digit % 10;
      direction = (digit < 3)
          ? 1
          : (digit < 8)
              ? 0
              : (digit < 9)
                  ? 2
                  : 3;

      int colorIndex = digits[(index + 1) % length] % 10;
      Color color = this.colors[colorIndex];
      if (used.contains(colorIndex)) {
        color = this.alt_colors[index%10];
      }
      int repeat = digits[(index + 2) % length] % 2;
      int which =
          digits[(index + 3) % length] % [this.spread(this.shapes)].length;
      this.shapes = this.split(this.shapes, which, direction, color, repeat);
      used.add(colorIndex);
    });
    used = [];
    digits.asMap().forEach((index, digit) {
      if (digit == 0) {
        int colorIndex = digits[(index + 1) % length] % 10;
        Color color = this.colors[colorIndex];
        if (used.contains(colorIndex)) {
          color = this.alt_colors[index%10];
        }
        this.shapes.add(Circle.fromShape(this.shapes[index], color));
        used.add(colorIndex);
      }
    });
    // print(this.shapes.toString());
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
