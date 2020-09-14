import 'dart:async';
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
      yield InitialLoginState();
    } else if (event is SendOtpEvent) {
      yield LoadingState();
      try {
        subscription = sendOtp(event.phoNo/*, event.context*/).listen((event) {
          add(event);
        });
      } catch (e) {
        print(e);
        // Phoenix.rebirth(context)

      }
    } else if (event is OtpSendEvent) {
      yield OtpSentState();
    } else if (event is LoginCompleteEvent) {
      yield LoginCompleteState(event.firebaseUser);
    } else if (event is LoginExceptionEvent) {
      yield ExceptionState(message: event.message);
    } else if (event is VerifyOtpEvent) {
      yield LoadingState();
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
          yield OtpExceptionState(message: 'INVALID_OTP'.tr());
        }
      } catch (e) {
        yield OtpExceptionState(message: 'INVALID_OTP'.tr());
        print(e);
      }
    }
  }

  @override
  void onEvent(LoginEvent event) {
    // TODO: implement onEvent
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
    // StreamController().add(LoginExceptionEvent(e.toString()));
    // StreamController().add(LoginCompleteEvent);
    //InitialLoginState();
    final eventStream = StreamController();
    eventStream.add(LoginExceptionEvent(onError.toString()));
    eventStream.close();
  }

  Future<void> close() async {
    super.close();
  }

  Stream<LoginEvent> sendOtp(String phoNo/*, BuildContext context*/) async* {
    try {
      print("Phone number: "+phoNo);
      StreamController<LoginEvent> eventStream = StreamController();
      final phoneVerificationCompleted = (AuthCredential authCredential) {
        print("AUTH SUCCESS:: Your account is successfully verified");
        // TODO: not sure this needs to be called, appears to be double call.
        // _userRepository.getUser().catchError((onError) {
        //   print(onError);
        //   eventStream.add(LoginExceptionEvent(onError.toString()));
        //   eventStream.close();
        // }).then((user) {
        // eventStream.add(LoginCompleteEvent());
        // eventStream.close();
        // });
      };
      final phoneVerificationFailed = (FirebaseAuthException authException) {
        // print("AUTH FAILED::"+authException.message);
        print("AUTH FAILED::" + authException.message);
        eventStream.add(LoginExceptionEvent(authException.message));
        eventStream.close();
      };
      final phoneCodeSent = (String verId, [int forceResent]) {
        print("AUTH CODE SENT::" + verId);
        this.verID = verId;
        eventStream.add(OtpSendEvent());
      };
      final phoneCodeAutoRetrievalTimeout = (String verid) {
        print("AUTH TIMEOUT:: --->::" + verid);
        this.verID = verid;
        eventStream.add(LoginExceptionEvent('AUTH_TIMEOUT'.tr()));
        eventStream.close();
      };
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoNo,
        timeout: const Duration(seconds: 60),
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
      );

      yield* eventStream.stream;
    } catch (e) {
      print(e);
      // throw(e);
      // Phoenix.rebirth(context); // dependOnInheritedWidgetOfExactType
      // todo: figure out how to recover gracefully here.
      // StreamController().add(LoginExceptionEvent(e.toString()));
      // StreamController().add(LoginCompleteEvent);
      //InitialLoginState();
      // final eventStream = StreamController();
      // eventStream.add(LoginExceptionEvent(onError.toString()));
      // eventStream.close();
      // }
    }
  }
}
