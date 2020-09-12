import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:theprotestersoath/authentication/authentication.dart';
import 'package:theprotestersoath/home/home_page.dart';
import 'package:theprotestersoath/login/LoginPage.dart';
import 'package:theprotestersoath/splash/splash_page.dart';

import 'home/sample_page.dart';
import 'navigation/bloc/appdrawer_state.dart';
import 'navigation/bloc/appdrawer_bloc.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Protester's Oath",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return LoginPage();
          } else if (state is Authenticated) {
            return AppView();
          } else {
            return SplashPage();
          }
        },
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppdrawerBloc>(
        create: (context) => AppdrawerBloc(),
        child: MaterialApp(
          title: "The Protester's Oath",
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: BlocBuilder<AppdrawerBloc, AppdrawerState>(
            builder: (context, state) {
              if (state is SamplePageState) {
                return SamplePage();
              } else if (state is HomePageState) {
                // Navigator.of(context).pop();
                return HomePage();
              } else {
                return SplashPage();
              }
            },
          ),
        ));
  }
}
