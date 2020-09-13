import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/res.dart';

class TheOathHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
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

class TheOath extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
          child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  OathText('POINT_01'.tr()),
                  OathText('POINT_02'.tr()),
                  OathText('POINT_03'.tr()),
                  OathText('POINT_04'.tr()),
                  OathText('POINT_05'.tr()),
                  OathText('POINT_06'.tr()),
                  OathText('POINT_07'.tr()),
                  OathText('POINT_08'.tr()),
                  OathText('POINT_09'.tr()),
                  OathText('POINT_10'.tr()),
                ],
              ),
            ),
          ),
        ],
      ));
}

class OathText extends StatelessWidget {
  final String text;

  OathText(this.text);

  @override
  Widget build(BuildContext context) => Center(
        child: Card(
          elevation: 7.0,
          color: Colors.grey,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                this.text.tr(),
                textAlign: TextAlign.left,
                overflow: TextOverflow.visible,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
              )),
        ),
      );
}
