import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PrivacyContainer extends StatelessWidget {
  // App Bar for the Login/Oath.
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(shrinkWrap: false, slivers: <Widget>[
      SliverToBoxAdapter(
        child: Padding(
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
                      text: 'PRIVACY_TITLE'.tr() + '\n\n'),
                  TextSpan(text: 'PRIVACY1'.tr() + '\n\n'),
                  TextSpan(text: 'PRIVACY2'.tr() + '\n\n'),
                ]),
          ),
        ),
      ),
      // Text('The power of protest is to reveal truth in the face of unjust power through non-violent action.'),
    ]);
  }
}
