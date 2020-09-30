import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';

  @override
  List<Object> get props => [];
}

class LoginReasonPageEvent extends AuthenticationEvent {
  @override
  String toString() => 'LoginReasonPage';

  @override
  List<Object> get props => [];
}

class LoginPrivacyPageEvent extends AuthenticationEvent {
  @override
  String toString() => 'LoginPrivacyPage';

  @override
  List<Object> get props => [];
}

class LoggedIn extends AuthenticationEvent {
  LoggedIn({@required this.token}) : super([token]);
  final String token;

  @override
  String toString() => 'LoggedIn { token: $token }';

  @override
  List<Object> get props => [token];
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';

  @override
  List<Object> get props => [];
}
