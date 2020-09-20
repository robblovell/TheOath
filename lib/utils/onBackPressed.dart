import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theprotestersoath/authentication/authentication_bloc.dart';
import 'package:theprotestersoath/authentication/authentication.dart';
import 'package:theprotestersoath/navigation/app_drawer/appdrawer.dart';

import '../app.dart';

Future<bool> onBackPressed(BuildContext context, isLogin, state) {
  if (true || isLogin || state is HomePageState) {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.pop(context),
    // Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("YES"),
                // Keep app in background? SystemChannels.platform.invokeMethod('SystemNavigator.pop')
              ),
            ],
          ),
        ) ??
        Future<bool>.value(false);
  }
  // Navigator.of(context).pop(false);
  // none of these worked for a non-dialog based back for non-home pages while logged in.
  // BlocProvider.of<AppDrawerBloc>(context).add(BackButtonEvent());

  // BlocProvider.of<AppDrawerBloc>(context).add(HomePageEvent());
  // BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
  // Navigator.pop(context);
  // Navigator.push(context, MaterialPageRoute(builder: (context) => AppView()));
  return Future<bool>.value(false);
}
