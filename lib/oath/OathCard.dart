import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/utils/sizing.dart';

class OathCard extends StatelessWidget {
  final String text;

  OathCard(this.text);

  @override
  Widget build(BuildContext context) {
    final double width = screenWidth(context);
    final double height = screenHeight(context);
    final double fontSize = ((height-300)/20).toInt().toDouble();
    final double minFontSize = ((height-300)/26).toInt().toDouble();
    // print("height: "+height.toString()+ " width: "+width.toString());
    // print("Font Size: "+fontSize.toString());
    // print("Min Font Size: "+minFontSize.toString());
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
