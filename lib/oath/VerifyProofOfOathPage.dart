import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protestersoath/home/ShapesPainter.dart';
import 'package:protestersoath/navigation/app_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_event.dart';
import '../navigation/app_drawer/appdrawer.dart';

class VerifyProofOfOathPage extends StatelessWidget {
  // static Route route() {
  //   return MaterialPageRoute<void>(builder: (_) => HomePage());
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppDrawerBloc, AppDrawerState>(
        builder: (BuildContext context, AppDrawerState state) {
      return Scaffold(
          // drawer: AppDrawer(),
          appBar: AppBar(
              title: Text(
                "VERIFY_TITLE".tr(),
                style: TextStyle(color: Colors.white),
              ),
              leading: (() {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    BlocProvider.of<AppDrawerBloc>(context)
                        .add(VerifyPageEvent());
                  },
                );
              })()),
          body: Stack(children: <Widget>[
            CustomPaint(
              size: Size.infinite,
              child: Container(
                height: MediaQuery.of(context).size.height,
              ),
              painter:
                  ShapesPainter((state as VerifyProofOfOathState).othersPhone),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    alignment: Alignment(0.0, 0.76),
                    child: Text(
                      'OATH_VERIFIED'.tr() +
                          "\n\n Phone: " +
                          (state as VerifyProofOfOathState).othersPhone,
                      textScaleFactor: 1.8,
                    ),
                  ),
                )),
          ]));
    });
  }
}
