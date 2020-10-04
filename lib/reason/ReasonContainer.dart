import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TheReason extends StatelessWidget {
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
                      text: 'REASON_TITLE'.tr() + '\n\n'),
                  TextSpan(text: 'REASON0'.tr() + '\n\n'),
                  TextSpan(text: 'REASON1'.tr() + '\n\n'),
                  TextSpan(text: 'REASON2'.tr() + '\n\n'),
                  TextSpan(text: 'REASON3'.tr() + '\n\n'),
                  TextSpan(text: 'REASON4'.tr() + '\n\n'),
                  TextSpan(text: 'REASON5'.tr() + '\n\n'),
                  TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      text: 'EXPLAIN_TITLE'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN1'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN2'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN3'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN4'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN5'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN6'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN7'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN8'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN9'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN10'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN11'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN12'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN13'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN14'.tr() + '\n\n'),
                  TextSpan(text: 'EXPLAIN15'.tr() + '\n\n'),
                ]),
          ),
        ),
      ),
      // Text('The power of protest is to reveal truth in the face of unjust power through non-violent action.'),
    ]);
  }
}
