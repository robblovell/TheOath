import 'package:flutter/material.dart';
import './oath_proof_painter.dart';
import './ShapesPainter.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepOrangeAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Shapes'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomPaint(
            painter: ShapesPainter(),
            child: Container(
              height: 700,
            ),
          ),
        ),
      ),
    );
    // return Stack(
    //     children: <Widget>[
    //     //1
    //     CustomPaint(
    //     size: Size.infinite, //2
    //       painter: OathProofPainter(color: Color(0xFF1f6fff)), //3
    //     ),
    //   ]);
  }
}
