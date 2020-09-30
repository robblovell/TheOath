import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_session/flutter_session.dart';
import './authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(InitialAuthenticationState());

  // @override
  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      // todo: set initial login state to true if we have a token.

      bool hasToken = await FlutterSession().get("isAuth") as bool;
      if (hasToken == null || !hasToken) {
        // try saved preferences:
        final prefs = await SharedPreferences.getInstance();
        hasToken = prefs.getBool('isAuth') ?? null;
      }

      if (hasToken != null && hasToken) {
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    }

    if (event is LoggedIn) {
      await FlutterSession().set("isAuth", true);
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isAuth', true);
      yield Loading();
      yield Authenticated();
    }

    if (event is LoggedOut) {
      await FlutterSession().set("isAuth", false);
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isAuth', false);
      yield Loading();
      yield Unauthenticated();
    }
    if (event is LoginReasonPageEvent) {
      yield LoginReasonPageState();
    }
    if (event is LoginPrivacyPageEvent) {
      yield LoginPrivacyPageState();
    }
  }
}
