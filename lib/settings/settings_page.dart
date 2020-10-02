import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:preferences/preference_service.dart';
import 'package:protestersoath/navigation/app_drawer.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_event.dart';
import '../navigation/app_drawer/appdrawer.dart';
import '../navigation/app_drawer/appdrawer_state.dart';
import 'SettingsContainer.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage();

  final drawer = PrefService.getString('drawer', ignoreCache: true);

  // static Route route() {
  //   return MaterialPageRoute(builder: (_) => ReasonPage(this.isLogin));
  // }

  @override
  Widget build(BuildContext context) {

      return BlocBuilder<AppDrawerBloc, AppDrawerState>(
          builder: (BuildContext context, AppDrawerState state) {
            return Scaffold(
              drawer:this.drawer=='all' ? AppDrawer() : null,
              appBar: AppBar(
                  title: Text(
                    "SETTINGS_TITLE".tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: (() {
                    return this.drawer=='all' ? null : IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        BlocProvider.of<AppDrawerBloc>(context)
                            .add(BackButtonEvent("SettingsPage"));
                      },
                    );
                  })()
              ),
              body: SettingsContainer(), //TheReason(),
            );
          });
  }
}
