import 'package:flutter/material.dart';
import 'package:theprotestersoath/data/Token.dart';

import 'PaintingCode.dart';

class ShapesPainter extends CustomPainter {
  Token token;
  ShapesPainter(Token token) {
    this.token = token;
  }
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Create a rectangle with size and width same as the canvas
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    List<Shape> shapes = new List<Shape>();
    shapes.add(new Rectangle(rect, Colors.grey[500]));

    PaintingCode painting = new PaintingCode(shapes);
    painting.makePainting(this.token.phoneNumber);
    painting.draw(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
