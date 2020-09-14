import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class OathCard extends StatelessWidget {
  final String text;

  OathCard(this.text);

  @override
  Widget build(BuildContext context) => Center(
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
              minFontSize: 14,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black),
            )),
        )
    ),
  );
}
