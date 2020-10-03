import 'package:flutter/material.dart';
import 'package:protestersoath/data/Token.dart';
import 'package:protestersoath/utils/stripCorrectPhone.dart';

import 'PaintedBarcode/PaintedBarcode.dart';
import 'PaintedBarcode/Shape.dart';
import 'PaintedBarcode/Square.dart';

class ShapesPainter extends CustomPainter {
  String phoneNumber;
  ShapesPainter(String phone) {
    this.phoneNumber = phone;
  }
  @override
  void paint(Canvas canvas, Size size) {
    // Create a rectangle with size and width same as the canvas

    List<Object> shapes = List<Object>();

    // this.token.phoneNumber = "+16047621034";
    PaintedBarcode painting = PaintedBarcode(shapes);
    painting.makePainting(stripPlusOnePhone(this.phoneNumber), size.width, size.height);
    painting.draw(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
