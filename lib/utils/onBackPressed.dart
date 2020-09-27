import 'package:flutter/material.dart';
// import 'package:protestersoath/navigation/app_drawer/appdrawer.dart';

Future<bool> onBackPressed(BuildContext context, isLogin, state) {
  // if (isLogin || state is HomePageState) {
  return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit an App'),
          actions: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text("NO"),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(true),
              child: Text("YES"),
              // Keep app in background? SystemChannels.platform.invokeMethod('SystemNavigator.pop')
            ),
          ],
        ),
      ) ??
      Future<bool>.value(false);
  // }
  // return Future<bool>.value(false);
}
