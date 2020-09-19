import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/oath/OathCard.dart';
import 'package:theprotestersoath/utils/sizing.dart';

class TheOath extends StatelessWidget {
  TheOath(this.isLogin);

  bool isLogin=false;
  // App Bar for the Login/Oath.
  @override
  Widget build(BuildContext context) =>
      CustomScrollView(
        shrinkWrap: false,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("LOGIN_TITLE".tr()),
            ),
          ),
          TheOathGrid(isLogin)
        ]
  );
}

class TheOathGrid extends StatelessWidget {
  TheOathGrid(this.isLogin);

  bool isLogin=false;
  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var safePadding = (MediaQuery.of(context).padding.top+MediaQuery.of(context).padding.bottom)/2;
    var loginButtonSpace = isLogin?100:0;
    // Height of the Title Card above and the Number Entry card and the spacing between elements
    final cardHeight = (availableHeight-loginButtonSpace-150+safePadding)/9;
    final aspect = screenWidth(context)/cardHeight;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 3.0,
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

