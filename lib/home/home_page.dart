import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theprotestersoath/authentication/authentication.dart';
import 'package:theprotestersoath/navigation/app_drawer.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'UserID: ${FirebaseAuth.instance.currentUser.uid}',
            ),
            RaisedButton(
              child: const Text('Logout'),
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
