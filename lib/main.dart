import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theprotestersoath/authentication/authentication.dart';
import 'package:theprotestersoath/app.dart';

import 'i18n/yaml_asset_loader.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition.toString());
  }

  @override
  void onError(Cubit bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = SimpleBlocObserver();
  runApp(EasyLocalization(
    supportedLocales: [Locale('en')],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
    assetLoader: YamlAssetLoader(),
    child: BlocProvider(
        create: (context) => AuthenticationBloc()..add(AppStarted()),
        child: App()),
  ));
}
