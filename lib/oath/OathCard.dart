import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/utils/sizing.dart';

class OathCard extends StatelessWidget {
  final String text;
  bool isLogin=false;
  int index=-1;

  OathCard(this.text, this.isLogin, this.index);

  @override
  Widget build(BuildContext context) {
    final double width = screenWidth(context);
    final double height = screenHeight(context)-MediaQuery.of(context).padding.top;
    double aspect = width/height;

    final heightPart1 = height/(27);
    final aspectPart1 = 3 / aspect;
    final heightPart2 = height/(32);
    final aspectPart2 = 3 / aspect;

    final double fontSize = (heightPart1 - aspectPart1).toInt().toDouble();
    final double minFontSize = (heightPart2 - aspectPart2).toInt().toDouble();

    // if (this.index==0) {
    //   print("height: " + height.toString() + " width: " + width.toString());
    //   print("aspect: " + aspect.toString());
    //   print("heightPart1: " + heightPart1.toString() + " aspectPart1: " + aspectPart1.toString());
    //   print("heightPart2: " + heightPart2.toString() + " aspectPart2: " + aspectPart2.toString());
    //   print("Font Size: " + fontSize.toString());
    //   print("Min Font Size: " + minFontSize.toString());
    // }
    return Center(
      child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Container(
            child: Align(
                alignment: Alignment.topLeft,
                child: AutoSizeText(
                  this.text.tr(),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.visible,
                  stepGranularity: 1,
                  maxLines: 3,
                  minFontSize: minFontSize,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize,
                      color: Colors.black),
                )),
          )
      ),
    );
  }
}
