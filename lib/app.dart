import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:theprotestersoath/authentication/authentication.dart';
import 'package:theprotestersoath/home/home_page.dart';
import 'package:theprotestersoath/login/LoginPage.dart';
import 'package:theprotestersoath/splash/splash_page.dart';
import 'package:easy_localization/easy_localization.dart';

import 'about/about_page.dart';
import 'navigation/app_drawer/appdrawer_state.dart';
import 'navigation/app_drawer/appdrawer_bloc.dart';

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
      // localizationsDelegates: [
      //   // ... app-specific localization delegate[s] here
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   const Locale('en', ''), // English, no country code
      //   // ... other locales the app supports
      // ],
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primaryColor: Colors.grey,
        accentColor: Colors.grey[300],
        accentColorBrightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
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
    return BlocProvider<AppDrawerBloc>(
        create: (context) => AppDrawerBloc(),
        child: MaterialApp(
          title: 'APP_TITLE'.tr(),
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: BlocBuilder<AppDrawerBloc, AppDrawerState>(
            builder: (context, state) {
              if (state is AboutPageState) {
                return AboutPage();
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
