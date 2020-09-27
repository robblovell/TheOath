import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TheStory extends StatelessWidget {
  // App Bar for the Login/Oath.
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(shrinkWrap: false, slivers: <Widget>[
      // SliverAppBar(
      //   pinned: true,
      //   // expandedHeight: appBarHeight,
      //   flexibleSpace: FlexibleSpaceBar(
      //     titlePadding: EdgeInsets.zero,
      //     centerTitle: false,
      //     title: Text("REASON_TITLE".tr()),
      //   ),
      // ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 2700,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(20),
              child:
              ),
          ),
          // Text('The power of protest is to reveal truth in the face of unjust power through non-violent action.'),
        ),
      ),
    ]);
  }
}
