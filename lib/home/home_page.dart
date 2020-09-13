import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theprotestersoath/authentication/authentication.dart';
import 'package:theprotestersoath/navigation/app_drawer.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HOME'.tr())),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'UserID: ${FirebaseAuth.instance.currentUser!=null?FirebaseAuth.instance.currentUser.uid:"none"}',
            ),
            RaisedButton(
              child: Text('LOGOUT'.tr()),
              onPressed: () {
                context
                    .bloc<AuthenticationBloc>()
                    .add(LoggedOut());
              },
            ),
          ],
        ),
      ),
    );
  }
}
