import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:theprotestersoath/navigation/app_drawer/appdrawer_event.dart';
import 'package:theprotestersoath/authentication/authentication.dart';

import '../res.dart';
import 'ReasonContainer.dart';

class ReasonPage extends StatelessWidget {
  ReasonPage(this.isLogin);

  bool isLogin = true;
  // static Route route() {
  //   return MaterialPageRoute(builder: (_) => ReasonPage(this.isLogin));
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "THEREASON".tr(),
          style: new TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (this.isLogin) {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            } else {
              BlocProvider.of<AppDrawerBloc>(context).add(BackButtonEvent());
            }
          },
        ),
      ),
      body: TheReason(),
    );
  }
}
