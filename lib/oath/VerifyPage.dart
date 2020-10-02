import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:preferences/preference_service.dart';
import 'package:protestersoath/navigation/app_drawer.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_event.dart';

import '../navigation/app_drawer/appdrawer.dart';
import '../navigation/app_drawer/appdrawer_state.dart';
import 'VerifyContainer.dart';

class VerifyPage extends StatelessWidget {
  VerifyPage();

  // static Route route() {
  //   return MaterialPageRoute(builder: (_) => VerifyPage(this.isLogin));
  // }
  final drawer = PrefService.getString('drawer', ignoreCache: true);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppDrawerBloc, AppDrawerState>(
        builder: (BuildContext context, AppDrawerState state) {
      return Scaffold(
        drawer: this.drawer=='all' ? AppDrawer() : null,
        backgroundColor: Colors.grey,
        appBar: AppBar(
            title: Text(
              "VERIFY_TITLE".tr(),
              style: TextStyle(color: Colors.white),
            ),
            leading: this.drawer=='all' ? null : IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  BlocProvider.of<AppDrawerBloc>(context)
                      .add(BackButtonEvent("VerifyPage"));
                },
              )
        ),
        body: VerifyContainer(),
      );
    });
  }
}
