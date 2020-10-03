import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:protestersoath/login/NumberInputVerify.dart';

class VerifyContainer extends StatelessWidget {
  // App Bar for the Login/Oath.
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:20, right:20, top:20, bottom:0),
            child: RichText(
              overflow: TextOverflow.visible,
              text: TextSpan(
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: 'VERIFY1'.tr() + '\n\n'),
                    TextSpan(text: 'VERIFY2'.tr() ),
                  ]),
            ),
          ),
          Container(
            // A fixed-height child that holds a phone entry or pin entry
            color: Colors.grey,
            height: 170.0,
            alignment: Alignment.center,
            child: NumberInputVerify(),
          )

        ]));

  }
}
