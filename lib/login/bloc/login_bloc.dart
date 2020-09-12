import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // final UserRepository _userRepository;
  StreamSubscription subscription;

  String verID = "";

  LoginBloc()
      : super(InitialLoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event,) async* {
    if (event is SendOtpEvent) {
      yield LoadingState();
      subscription = sendOtp(event.phoNo).listen((event) {
        add(event);
      });
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
          yield OtpExceptionState(message: "Invalid otp!");
        }
      } catch (e) {
        yield OtpExceptionState(message: "Invalid otp!");
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
    print(stacktrace);
  }

  Future<void> close() async {
    print("Bloc closed");
    super.close();
  }

  Stream<LoginEvent> sendOtp(String phoNo) async* {
    StreamController<LoginEvent> eventStream = StreamController();
    final phoneVerificationCompleted = (AuthCredential authCredential) {
      print("Your account is successfully verified");
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
      print(authException.message);
      eventStream.add(LoginExceptionEvent(onError.toString()));
      eventStream.close();
    };
    final phoneCodeSent = (String verId, [int forceResent]) {
      this.verID = verId;
      eventStream.add(OtpSendEvent());
    };
    final phoneCodeAutoRetrievalTimeout = (String verid) {
      this.verID = verid;
      eventStream.add(LoginExceptionEvent(onError.toString()));
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
  }
}
