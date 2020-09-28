import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:protestersoath/data/Protester.dart';

@immutable
abstract class LoginState extends Equatable {}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginCompleteState extends LoginState {
  final Protester _localUser;
  LoginCompleteState(this._localUser);
  Protester getUser() {
    return _localUser;
  }

  @override
  List<Object> get props => [_localUser];
}

class ExceptionState extends LoginState {
  final String message;
  ExceptionState({this.message});
  @override
  List<Object> get props => [message];
}

