import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_event.dart';
import 'package:protestersoath/authentication/authentication.dart';

import '../navigation/app_drawer/appdrawer.dart';
import '../navigation/app_drawer/appdrawer_state.dart';
import 'ReasonContainer.dart';

class ReasonPage extends StatelessWidget {
  ReasonPage(this.isLogin);

  bool isLogin = true;

  // static Route route() {
  //   return MaterialPageRoute(builder: (_) => ReasonPage(this.isLogin));
  // }

  @override
  Widget build(BuildContext context) {
    if (this.isLogin) {
      return Scaffold(
        appBar: AppBar(
            title: Text(
              "THEREASON".tr(),
              style: TextStyle(color: Colors.white),
            ),
            leading: (() {
              return IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                },
              );
            })()),
        body: TheReason(),
      );
    } else {
      return BlocBuilder<AppDrawerBloc, AppDrawerState>(
          builder: (BuildContext context, AppDrawerState state) {
        return Scaffold(
          appBar: AppBar(
              title: Text(
                "THEREASON".tr(),
                style: TextStyle(color: Colors.white),
              ),
              leading: (() {
                if (this.isLogin) {
                  return IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(LoggedOut());
                    },
                  );
                } else {
                  AppDrawerEvent lastPage = (state as ReasonPageState).lastPage;
                  return IconButton(
                    icon: Icon(lastPage is OathPageEvent
                        ? Icons.arrow_back
                        : Icons.arrow_back),
                    onPressed: () {
                      BlocProvider.of<AppDrawerBloc>(context)
                          .add(ReasonBackButtonEvent(lastPage));
                    },
                  );
                }
              })()),
          body: TheReason(),
        );
      });
    }
  }
}
