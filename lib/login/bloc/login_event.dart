import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:protestersoath/data/Protester.dart';

@immutable
class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendOtpEvent extends LoginEvent {
  final String phoNo;
  final BuildContext context;
  SendOtpEvent({this.phoNo, this.context});
}

class AppStartEvent extends LoginEvent {}

class LogoutEvent extends LoginEvent {}

class LoginCompleteEvent extends LoginEvent {
  final Protester localUser;
  LoginCompleteEvent(this.localUser);
}

class LoginExceptionEvent extends LoginEvent {
  final String message;
  LoginExceptionEvent(this.message);
}
