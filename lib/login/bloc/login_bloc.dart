import 'dart:async';
import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bloc/bloc.dart';
import 'package:protestersoath/data/Protester.dart';
import './login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  StreamSubscription subscription;

  String verID = "";

  LoginBloc() : super(InitialLoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event,) async* {
    if (event is AppStartEvent) {
      yield InitialLoginState(); // go back from the pin page leads here.
    } else if (event is SendOtpEvent) {
      // a number has been entered and I commit pressed:
      yield LoadingState();
      final Protester user = Protester();
      user.phoneNumber = event.phoNo;
      String json = jsonEncode(user);
      await FlutterSession().set('protester', json);
      yield LoginCompleteState(user);
    } else if (event is LoginExceptionEvent) {
      yield ExceptionState(message: event.message);
    }
  }

  @override
  void onEvent(LoginEvent event) {
    // TODO: implement onEvent
    super.onEvent(event);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    // TODO: implement onError
    super.onError(error, stacktrace);
    final eventStream = StreamController();
    eventStream.add(LoginExceptionEvent('SOMETHING_WRONG_5'.tr() + " (Error 05) " + onError.toString()));
    eventStream.close();
  }

  Future<void> close() async {
    super.close();
  }
}
