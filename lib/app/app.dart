import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

import 'package:theprotestersoath/authentication/authentication.dart';
import 'package:theprotestersoath/home/home_page.dart';
import 'package:theprotestersoath/login/LoginPage.dart';
import 'package:theprotestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:theprotestersoath/reason/reason_page.dart';
import 'package:theprotestersoath/splash/splash_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/stories/stories_cubit.dart';
import 'package:theprotestersoath/stories/story_page.dart';
import 'package:theprotestersoath/utils/onBackPressed.dart';

import '../about/about_page.dart';
import '../navigation/app_drawer/appdrawer_state.dart';
import '../navigation/app_drawer/appdrawer_event.dart';
import '../oath/oath_page.dart';

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
          } else if (state is LoginReasonPageState) {
            return ReasonPage(true);
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

  var state = null;

  Future<bool> _onBackPressed() {
    return onBackPressed(context, false, this.state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppDrawerBloc>(
        create: (context) => AppDrawerBloc(),
        child: WillPopScope(
            onWillPop: _onBackPressed,
            child: MaterialApp(
              title: 'APP_TITLE'.tr(),
              theme: ThemeData(
                  primarySwatch: Colors.grey,
                  appBarTheme: AppBarTheme(color: Colors.grey)),
              home: BlocBuilder<AppDrawerBloc, AppDrawerState>(
                builder: (context, state) {
                  this.state = state;
                  if (state is LoadingState) {
                    BlocProvider.of<AppDrawerBloc>(context).add(LoadingEvent());
                    return SplashPage();
                  }
                  if (state is AboutPageState) {
                    return AboutPage();
                  } else if (state is HomePageState) {
                    // Navigator.of(context).pop();
                    return HomePage();
                  } else if (state is StoryPageState) {
                    // Navigator.of(context).pop();
                    return CubitProvider<StoriesCubit>(
                      create: (context) => StoriesCubit(),
                      child: StoryPage(),
                    );
                  } else if (state is OathPageState) {
                    // Navigator.of(context).pop();
                    return OathPage();
                  } else if (state is ReasonPageState) {
                    // Navigator.of(context).pop();
                    return ReasonPage(false);
                  } else {
                    return SplashPage();
                  }
                },
              ),
            )));
  }
}
