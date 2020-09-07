import 'package:theprotestersoath/authenticate/bloc.dart';
import 'package:theprotestersoath/login/bloc/bloc.dart';
import 'package:theprotestersoath/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './OtpInput.dart';
import './Header.dart';
import './NumberInput.dart';
import './LoadingIndicator.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: _loginBloc,
      listener: (context, loginState) {
        if (loginState is ExceptionState || loginState is OtpExceptionState) {
          String message;
          if (loginState is ExceptionState) {
            message = loginState.message;
          } else if (loginState is OtpExceptionState) {
            message = loginState.message;
          }
          final snackBar = SnackBar(
            content: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.error),
                  ),
                  TextSpan(
                    text: message,
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.red,
          );
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Header(),
                        Container(
                          child: ConstrainedBox(
                            constraints:
                            BoxConstraints.tight(Size.fromHeight(200)),
                            child: getViewAsPerState(state),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(62))),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  getViewAsPerState(LoginState state) {
    if (state is Unauthenticated) {
      return NumberInput();
    } else if (state is OtpSentState || state is OtpExceptionState) {
      return OtpInput();
    } else if (state is LoadingState) {
      return LoadingIndicator();
    } else if (state is LoginCompleteState) {
      BlocProvider.of<AuthenticationBloc>(context)
          .add(LoggedIn(token: state.getUser().uid));
    } else {
      return NumberInput();
    }
  }
}
