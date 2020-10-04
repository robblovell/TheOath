import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:preferences/preference_service.dart';
import 'package:protestersoath/authentication/authentication_bloc.dart';
import 'package:protestersoath/authentication/authentication_event.dart';
// import 'package:global_configuration/global_configuration.dart';
import 'package:protestersoath/navigation/app_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../navigation/app_drawer/appdrawer.dart';
import 'ShapesPainter.dart';

class HomePage extends StatelessWidget {
  // static Route route() {
  //   return MaterialPageRoute<void>(builder: (_) => HomePage());
  // }
  final drawer = PrefService.getString('drawer', ignoreCache: true);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppDrawerBloc, AppDrawerState>(
        builder: (BuildContext context, AppDrawerState state) {
      return Scaffold(
          drawer: this.drawer!='none' ? AppDrawer() : null,
          appBar: AppBar(backgroundColor: Colors.grey,
            title: Text('HOME'.tr(),
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.art_track, size: 35),
                onPressed: () => BlocProvider.of<AppDrawerBloc>(context)
                    .add(StoryPageEvent()),
                tooltip: 'STORIES_TOOLTIP'.tr(),
              ),
            ],
          ),
          body: Stack(children: <Widget>[
            CustomPaint(
              size: Size.infinite,
              child: Container(height: MediaQuery.of(context).size.height,),
              painter: ShapesPainter((state as HomePageState).token.phoneNumber),
            ),
            Container(
                alignment: Alignment(0.9, 0.91),
                child: IconButton(
                  icon: Icon(Icons.list, color: Colors.black, size: 30,),
                  tooltip: 'OATH_TOOLTIP'.tr(),
                  onPressed: () => BlocProvider.of<AppDrawerBloc>(context)
                      .add(OathPageEvent()),
                )),
            Container(
                alignment: Alignment(-.9, 0.91),
                child: IconButton(
                  icon: Icon(Icons.privacy_tip, color: Colors.black, size: 30,),
                  tooltip: 'PRIVACY'.tr(),
                  onPressed: () => BlocProvider.of<AppDrawerBloc>(context)
                      .add(PrivacyPageEvent()),
                )),
            drawer == "none" ? Container(
                alignment: Alignment(-0.45, 0.91),
                child: IconButton(
                  icon: Icon(Icons.open_in_full, color: Colors.black, size: 30,),
                  tooltip: 'VERIFY'.tr(),
                  onPressed: () => BlocProvider.of<AppDrawerBloc>(context)
                      .add(VerifyPageEvent()),
                )):Container(),
            drawer == "none" ? Container(
                alignment: Alignment(0.0, 0.91),
                child: IconButton(
                  icon: Icon(Icons.settings, color: Colors.black, size: 30,),
                  tooltip: 'SETTINGS'.tr(),
                  onPressed: () => BlocProvider.of<AppDrawerBloc>(context)
                      .add(SettingsPageEvent()),
                )):Container(),
            drawer == "none" ? Container(
                alignment: Alignment(0.45, 0.91),
                child: IconButton(
                  icon: Icon(Icons.exit_to_app,color: Colors.black,size: 30,),
                  tooltip: 'LOGOUT'.tr(),
                  onPressed: () => BlocProvider.of<AuthenticationBloc>(context)
                      .add(LoggedOut()),
                )):Container(),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment(0.0, 0.72),
                child: Text(
                  'OATH_TAKEN'.tr(),
                  textScaleFactor: 1.8,
                ),
              ),
            ),

          ]));
    });
  }
}
