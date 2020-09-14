import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/oath/OathCard.dart';
import 'package:theprotestersoath/utils/sizing.dart';

class TheOath extends StatelessWidget {
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
    final height = screenHeight(context);
    final heightNoBar = screenHeightExcludingToolbar(context);
    final hnb9 = (heightNoBar-250)/9;
    print ("Width: $width");
    print ("Height: $height");
    print ("HeightNoBar: $heightNoBar");
    print ("HeightNoBar/9: ${heightNoBar/9}");
    print ("Height/Width: ${height/width}");
    print ("width/height: ${width/height}");
    print ("width/hnb9: ${width/hnb9}");
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: width/hnb9, // between 7 and 9.

      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Container(
            alignment: Alignment.centerLeft,
            color: Colors.grey[200 + index % 2 * 200],
            child: OathCard('POINT_0$index'),
          );
        },
        childCount: 9,
      ),
    );
  }
}

