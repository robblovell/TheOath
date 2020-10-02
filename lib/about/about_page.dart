import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:preferences/preference_service.dart';
// import 'package:global_configuration/global_configuration.dart';
import 'package:protestersoath/navigation/app_drawer.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_event.dart';

import '../res.dart';

class AboutPage extends StatelessWidget {
  // static Route route() {
  //   return MaterialPageRoute(builder: (_) => AboutPage());
  // }
  final drawer = PrefService.getString('drawer', ignoreCache: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: this.drawer=='all' ? AppDrawer() : null,
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          "About",
          style: TextStyle(color: Colors.white),
        ),
        leading: this.drawer=='all' ? null : IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            BlocProvider.of<AppDrawerBloc>(context)
                .add(BackButtonEvent("AboutPage"));
          },
        ),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 190.0,
              height: 190.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(Res.robb),
                  ))),
          Container(height: 5),
          Text(
            'Made by: Robb E Lovell',
            textScaleFactor: 1.5,
          ),
          Container(height: 50),
          Container(
              width: 190.0,
              height: 190.0,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image:
                        AssetImage(Res.logo_flutter_transparent),
                  ))),
          Container(height: 5),
          Text(
            'Powered by: Flutter',
            textScaleFactor: 1.5,
          )
        ],
      )),
    );
  }
}
