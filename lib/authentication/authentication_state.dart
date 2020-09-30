import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState {}

class InitialAuthenticationState extends AuthenticationState {}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {}

class Unauthenticated extends AuthenticationState {}

class Loading extends AuthenticationState {}

class LoginReasonPageState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LoginPrivacyPageState extends AuthenticationState {
  @override
  List<Object> get props => [];
}