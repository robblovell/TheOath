import 'package:theprotestersoath/data/user_repository.dart';
import 'package:theprotestersoath/login/bloc/bloc.dart';
import 'package:theprotestersoath/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './LoginForm.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(userRepository: userRepository),
      child: Scaffold(
        body: LoginForm(),
      ),
    );
  }
}
