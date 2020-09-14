import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/res.dart';

class TheOathHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  Res.protester,
                  height: 40,
                  width: 50,
                ),
                Container(
                  height: 30,
                  child: Center(
                      child: Text(
                        "TITLE".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      )),
                ),
              ]));
}