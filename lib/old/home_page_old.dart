import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:theprotestersoath/authentication/authentication_bloc.dart';
import 'package:theprotestersoath/authentication/authentication_event.dart';
import 'package:theprotestersoath/old/drawer/drawer_widget.dart';
// import './oath_proof_painter.dart';
import '../home/ShapesPainter.dart';
import 'package:easy_localization/easy_localization.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepOrangeAccent,
      ),
      home: Scaffold(
          drawer: DrawerWidget("Joe Shmoe", "shmoe@joesemail.com"),
          appBar: AppBar(
            title: Text('Proof of Oath'),
          ),
          body: Stack(children: <Widget>[
            Text('UserID: ${FirebaseAuth.instance.currentUser!=null?FirebaseAuth.instance.currentUser.uid:"none"}',
            ),
            CustomPaint(
              size: Size.infinite,
              child: Container(
                height: 700,
              ),
              painter: ShapesPainter(),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  icon: new Icon(
                    MdiIcons.cogTransferOutline,
                    color: Colors.black,
                    size: 30,
                  ),
                  tooltip: 'SETTINGS'.tr(),
                  onPressed: () {
                    context.bloc<AuthenticationBloc>().add(LoggedOut());
                  },
                )),
            Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: new Icon(
                    MdiIcons.logout,
                    color: Colors.black,
                    size: 30,
                  ),
                  tooltip: 'LOGOUT'.tr(),
                  onPressed: () {
                    context.bloc<AuthenticationBloc>().add(LoggedOut());
                  },
                )),
          ])),
    );
  }
}
