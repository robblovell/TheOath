import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:theprotestersoath/authentication/authentication_bloc.dart';
import 'package:theprotestersoath/authentication/authentication_event.dart';
import 'package:theprotestersoath/drawer/drawer_widget.dart';
// import './oath_proof_painter.dart';
import './ShapesPainter.dart';

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
            Text('UserID: ${FirebaseAuth.instance.currentUser.uid}',
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
                  tooltip: 'Settings',
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
                  tooltip: 'Logout',
                  onPressed: () {
                    context.bloc<AuthenticationBloc>().add(LoggedOut());
                  },
                )),
          ])),
    );
  }
}
