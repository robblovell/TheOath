// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:theprotestersoath/navigation/app_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:theprotestersoath/navigation/app_drawer/appdrawer_event.dart';
import 'ShapesPainter.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('HOME'.tr())),
        drawer: AppDrawer(),

        appBar: AppBar(
          backgroundColor: Colors.grey,
          // theme: ThemeData(
          //   primaryColor: Colors.black,
          // ),
          title: Text('HOME'.tr(),
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.art_track, size: 40),
              onPressed: () =>
                  BlocProvider.of<AppDrawerBloc>(context).add(StoryPageEvent()),
            ),
          ],
        ),
        body: Stack(children: <Widget>[
          CustomPaint(
            size: Size.infinite,
            child: Container(
              height: 700,
            ),
            painter: ShapesPainter(),
          ),
          Container(
              alignment: Alignment(0.9, 0.91),
              child: IconButton(
                icon: new Icon(
                  Icons.article_outlined,
                  // IconData(0xe060, fontFamily: 'MaterialIcons'),
                  color: Colors.black,
                  size: 30,
                ),
                tooltip: 'STORIES_TOOLTIP'.tr(),
                onPressed: () => BlocProvider.of<AppDrawerBloc>(context)
                    .add(OathPageEvent()),
              )),
          Container(
              alignment: Alignment(-.9, 0.91),
              child: IconButton(
                icon: new Icon(
                  Icons.info,
                  // IconData(0xe060, fontFamily: 'MaterialIcons'),
                  color: Colors.black,
                  size: 30,
                ),
                tooltip: 'THEREASON'.tr(),
                onPressed: () => BlocProvider.of<AppDrawerBloc>(context)
                    .add(ReasonPageEvent()),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment(0.0, 0.80),
              child: Text('OATH_TAKEN'.tr(), textScaleFactor: 1.3,),
            ),
          ),
        ]));
  }
}
