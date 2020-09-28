import 'dart:async';
import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:protestersoath/data/Token.dart';
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
        subscription = sendOtp(event.phoNo).listen((event) {
          add(event);
        });
      } catch (e) {
        print(e);
      }
    } else if (event is OtpSendEvent) {
      yield OtpSentState(); // we get here after an otp is sent. the ui reacts by showing the pin entry screen.
    // candidate: this was commented out in e3c15d2c
    } else if (event is LoginCompleteEvent) {
      yield LoginCompleteState(event.firebaseUser);
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
        final Token token = Token();
        token.uid = user.uid;
        token.phoneNumber = user.phoneNumber;
        String json = jsonEncode(token);

        await FlutterSession().set('token', json);

        if (user != null) {
          yield LoginCompleteState(user);
        } else {
          yield OtpExceptionState(message: 'INVALID_OTP_7'.tr() + " (Error 07) ");
        }
      } catch (e) {
        if (e.message.substring(0, 7) == "The sms") {
          yield OtpExceptionState(message: 'INVALID_OTP2_9'.tr());
        } else {
          yield OtpExceptionState(message: 'SOMETHING_WRONG_6'.tr()); // + " (Error 06) " + e.message);
        }
      }
    }
  }

  @override
  void onEvent(LoginEvent event) {
    // TODO: implement onEvent
    super.onEvent(event);
    // print(event);
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
            eventStream.add(LoginExceptionEvent('SOMETHING_WRONG_8'.tr() + " (Error 08) "));
            eventStream.close();
          }
        } catch (error) {
          eventStream.add(LoginExceptionEvent('SOMETHING_WRONG_4'.tr() + " (Error 04) ")); // + error));
          // candidate: this had an await now but probalby shouldn't in e3c15d2c
          eventStream.close();
        }
      };
      final phoneVerificationFailed = (FirebaseAuthException authException) {
        var status = authException.message;
        if (status.contains("Caonnot evaluate")) {
          status = 'SOMETHING_WRONG_11'.tr();// + " (Error 11) " + status;
        } else if (status.contains('not authorized')) {
          status = 'SOMETHING_WRONG_3'.tr() + " (Error 03) " + status;
        } else if (status.contains('Network')) {
          status = 'NETWORK_ISSUES_2'.tr() + " (Error 02) " + status;
        } else if (status.contains('Invalid token')) {
          status = 'INVALID_TOKEN_12'.tr() + " (Error 12) ";// + status;
        }
        else {
          status = /*'SOMETHING_WRONG_1'.tr() + */" (Error 01) " + status; // todo: only add the exception message in debug mode.
        }
        eventStream.add(LoginExceptionEvent(status));
        eventStream.close();
      };
      final phoneCodeSent = (String verId, [int forceResent]) {
        this.verID = verId;
        eventStream.add(OtpSendEvent());
      };
      final phoneCodeAutoRetrievalTimeout = (String verid) {
        this.verID = verid;
        // candidate: this was not commented out in e3c15d2c
        // You don't need to do anything here with the end user.
        // eventStream.add(OtpSendEvent());
        // eventStream.add(LoginExceptionEvent('AUTH_TIMEOUT_10'.tr()));
        // eventStream.close();
      };
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoNo,
        timeout: const Duration(seconds: 60),//  timeout was 120.
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
      );
      yield* eventStream.stream;
    } catch (e) {
      print(e);
    }
  }
}
