import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/oath/OathCard.dart';
import 'package:theprotestersoath/utils/sizing.dart';

class TheOath extends StatelessWidget {

  // App Bar for the Login/Oath.
  @override
  Widget build(BuildContext context) =>
      CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 120.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("LOGIN_TITLE".tr()),
            ),
          ),
          TheOathGrid()
        ]
  );
}

class TheOathGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = screenWidth(context);
    final heightNoBar = screenHeightExcludingToolbar(context);
    final fudge = Theme.of(context).platform == TargetPlatform.android ? 20 : 0;
    // Height of the Title Card above and the Number Entry card and the spacing between elements
    final hnb9 = (heightNoBar-150-120-10+fudge)/9;
    final aspect = width/hnb9;

    print ("width/hnb9: ${width/hnb9}");


    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: aspect, // between 7 and 9.

      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Container(
            alignment: Alignment.centerLeft,
            color: Colors.grey[300 + index % 2 * 100],
            child: OathCard('POINT_0$index'),
          );
        },
        childCount: 9,
      ),
    );
  }
}

