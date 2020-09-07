import 'package:theprotestersoath/authenticate/bloc.dart';
import 'package:theprotestersoath/data/user_repository.dart';
import 'package:theprotestersoath/home/home_page.dart';
import 'package:theprotestersoath/login/LoginPage.dart';
import 'package:theprotestersoath/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authenticate/authentication_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition.toString());
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  // Inject the user repository into the application.
  // This is the touchpoint with the authenction persistence in firebase.
  UserRepository userRepository = UserRepository();
  runApp(BlocProvider(
    create: (context) => AuthenticationBloc(userRepository)..add(AppStarted()),
    child: MyApp(userRepository: userRepository),
  ));
}

class MyApp extends StatefulWidget {
  final UserRepository _userRepository;

  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

// The main top level application state.
class _MyAppState extends State<MyApp> {
  UserRepository get userRepository => widget._userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return LoginPage(userRepository: userRepository);
          } else if (state is Authenticated) {
            return HomePage();
          } else {
            return SplashPage();
          };
        },
      ),
    );
  }
}
