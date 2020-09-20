import 'dart:async';
import 'package:flutter_session/flutter_session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // final UserRepository _userRepository;
  StreamSubscription subscription;

  String verID = "";

  LoginBloc() : super(InitialLoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event,) async* {
    if (event is AppStartEvent) {
      yield InitialLoginState(); // go back from the pin page leads here.
    } else if (event is SendOtpEvent) {
      yield LoadingState();
      try {
        subscription = sendOtp(event.phoNo/*, event.context*/).listen((event) {
          add(event);
        });
      } catch (e) {
        // todo: things seem pretty unrecoverable here...
        print(e);
        // Phoenix.rebirth(context)
      }
    } else if (event is OtpSendEvent) {
      yield OtpSentState(); // we get here after an otp is sent. the ui reacts by showing the pin entry screen.
    // } else if (event is LoginCompleteEvent) {
    //   yield LoginCompleteState(event.firebaseUser);
    } else if (event is LoginExceptionEvent) {
      yield ExceptionState(message: event.message);
    } else if (event is VerifyOtpEvent) {
      yield LoadingState();
      // this fires when the user submits the pin on the pin entry page and the
      // auto verification has failed, so sign in the user manually.
      try {
        final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: this.verID,
          smsCode: event.otp,
        );
        final User user =
            (await FirebaseAuth.instance.signInWithCredential(credential)).user;
        if (user != null) {
          yield LoginCompleteState(user);
        } else {
          // todo: messaging in production
          yield OtpExceptionState(message: 'INVALID_OTP'.tr());
        }
      } catch (e) {
        // todo: messaging in production
        yield OtpExceptionState(message: 'SOMETHING_WRONG'.tr());
      }
    }
  }

  @override
  void onEvent(LoginEvent event) {
    // TODO: implement onEvent (contains phoNo)
    super.onEvent(event);
    print(event);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    // TODO: implement onError
    super.onError(error, stacktrace);
    print("AUTH ONERROR::" + onError.toString());
    print(stacktrace);
    // todo: figure out how to recover gracefully here.
    //InitialLoginState();
    final eventStream = StreamController();
    eventStream.add(LoginExceptionEvent(onError.toString()));
    eventStream.close();
  }

  Future<void> close() async {
    super.close();
  }

  Stream<LoginEvent> sendOtp(String phoNo) async* {
    try {
      StreamController<LoginEvent> eventStream = StreamController();

      final PhoneVerificationCompleted phoneVerificationCompleted = (AuthCredential authCredential) async* {
        // eventStream.add(OtpAutoRetrievalEvent()); // todo: tell the user we are auto validating.
        try {
          final User user = (await FirebaseAuth.instance.signInWithCredential(authCredential)).user;

          if (user != null) {
            // todo: is this path ever followed?
            eventStream.add(LoginCompleteEvent(user));
            eventStream.close();
          } else {
            eventStream.add(LoginExceptionEvent('INVALID_OTP'.tr()));
            eventStream.close();
          }
        } catch (error) {
          eventStream.add(LoginExceptionEvent('SOMETHING_WRONG'.tr() + error));
          eventStream.close();
        }
      };

      final phoneVerificationFailed = (FirebaseAuthException authException) {
        var status = authException.message;
        if (status.contains('not authorized'))
          // todo: messaging in production
          status = 'Something has gone wrong, please try later. '+status; // todo: only add the exception message in debug mode.
        else if (status.contains('Network'))
          // todo: messaging in production
          status = 'Please check your internet connection and try again. '+status;
        else
          // todo: messaging in production
          status = 'Something has gone wrong, please try later. '+status;
        eventStream.add(LoginExceptionEvent(status));
        eventStream.close();
      };
      final phoneCodeSent = (String verId, [int forceResent]) {
        this.verID = verId;
        eventStream.add(OtpSendEvent());
      };
      final phoneCodeAutoRetrievalTimeout = (String verid) {
        this.verID = verid;
        eventStream.add(LoginExceptionEvent('AUTH_TIMEOUT'.tr()));
        eventStream.close();
      };
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoNo,
        timeout: const Duration(seconds: 120),
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
      );
      yield* eventStream.stream;
    } catch (e) {
      // todo: figure out how to recover gracefully here.
      print(e);
    }
  }
}
