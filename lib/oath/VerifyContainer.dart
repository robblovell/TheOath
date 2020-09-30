import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:protestersoath/login/NumberInputVerify.dart';

class VerifyContainer extends StatelessWidget {
  // App Bar for the Login/Oath.
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: RichText(
              overflow: TextOverflow.visible,
              text: TextSpan(
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.black),
                  children: <TextSpan>[
                    // todo: clean this code up!
                    TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        text: 'VERIFY_TITLE'.tr() + '\n\n'),
                    TextSpan(text: 'VERIFY1'.tr() + '\n\n'),
                    TextSpan(text: 'VERIFY2'.tr() + '\n\n'),
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

        ]);

  }
}
