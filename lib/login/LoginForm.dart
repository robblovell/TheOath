import 'package:theprotestersoath/authentication/authentication.dart';
import 'package:theprotestersoath/oath/OathContainer.dart';
import 'package:theprotestersoath/login/bloc/login.dart';
import 'package:theprotestersoath/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './PinInput.dart';
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
      cubit: _loginBloc,
      listener: (context, loginState) {
        if (loginState is ExceptionState || loginState is OtpExceptionState) {
          String message;
          if (loginState is ExceptionState) {
            message = loginState.message;
          } else if (loginState is OtpExceptionState) {
            message = loginState.message;
          }
          final snackBar = SnackBar(
            content: Container(
              height: 125,
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.error),
                    ),
                    TextSpan(text: "  "),
                    TextSpan(
                        text: message,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.redAccent,
          );
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
      // https://medium.com/flutter-community/a-guide-to-using-screensize-in-flutter-a-more-readable-approach-901e82556195
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          // A flexible child that will grow to fit the viewport but
                          // still be at least as big as necessary to fit its contents.
                          child: Container(
                            color: Colors.grey[100],
                            height: 18.0,
                            alignment: Alignment.center,
                            child: TheOath(),
                          ),
                        ),
                        Container(
                          // A fixed-height child.
                          color: Colors.grey, //const Color(0xff00ccee),
                          height: 150.0,
                          alignment: Alignment.center,
                          child: getViewAsPerState(state),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  getViewAsPerState(LoginState state) {
    if (state is Unauthenticated) {
      return NumberInput();
    } else if (state is OtpSentState || state is OtpExceptionState) {
      return PinInput();
    } else if (state is LoadingState) {
      return LoadingIndicator();
    } else if (state is LoginCompleteState) {
      BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn(
          token: state.getUser() != null ? state.getUser().uid : "none"));
    } else {
      return NumberInput();
    }
  }
}
