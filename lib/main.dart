import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:global_configuration/global_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preferences/preference_service.dart';
import 'package:protestersoath/authentication/authentication.dart';
import 'package:protestersoath/app/app.dart';

import 'config.dart';
import 'l10n/yaml_asset_loader.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // print(transition.toString());
  }

  @override
  void onError(Cubit bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    // print(event);
  }
}

Future<void> main() async {
  // GlobalConfiguration().loadFromMap(appSettings);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PrefService.init(prefix: 'pref_');
  PrefService.setDefaultValues({'drawer': 'home'});

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
