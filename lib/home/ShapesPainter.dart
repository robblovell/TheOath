import 'package:flutter/material.dart';
import 'package:theprotestersoath/data/Token.dart';

import 'PaintedBarcode/PaintedBarcode.dart';
import 'PaintedBarcode/Shape.dart';
import 'PaintedBarcode/Square.dart';

class ShapesPainter extends CustomPainter {
  Token token;
  ShapesPainter(Token token) {
    this.token = token;
  }
  @override
  void paint(Canvas canvas, Size size) {
    // Create a rectangle with size and width same as the canvas
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    List<Shape> shapes = List<Shape>();
    shapes.add(Square(rect, Colors.grey[500]));
    // this.token.phoneNumber = "6047621034";
    PaintedBarcode painting = PaintedBarcode(shapes);
    painting.makePainting(this.token.phoneNumber);
    painting.draw(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
