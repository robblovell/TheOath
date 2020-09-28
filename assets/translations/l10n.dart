import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter_localizations/flutter_localizations.dart';

const supportedLocales = [Locale('en', '')];
const localizationsDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

class LOCAL {
  LOCAL(this.locale);

  final Locale locale;

  static LOCAL of(BuildContext context) {
    return Localizations.of<LOCAL>(context, LOCAL);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': "Protester's Oath",
    },
    'es': {
      // Spanish
      'title': "El Juramento Del Manifestante",
    },
    'fr': {
      // French
      'title': "Le serment du manifestant",
    },
    'zh': {
      // Chinese
      'title': "抗议者的誓言",
    },
    'ru': {
      // Russian
      'title': "Клятва протестующего",
    },
    'ar': {
      // Arabic
      'title': "قسم المحتج",
    },
    'hi': {
      // Hindi
      'title': "रक्षक की शपथ",
    },
    'pt': {
      // Portuguese
      'title': "O juramento do manifestante",
    },
    'mr': {
      // Marathi
      'title': "निषेध करणारी व्यक्ती",
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }
}

class ProtestersOathLocalizationsDelegate extends LocalizationsDelegate<LOCAL> {
  const ProtestersOathLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<LOCAL> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<LOCAL>(LOCAL(locale));
  }

  @override
  bool shouldReload(ProtestersOathLocalizationsDelegate old) => false;
}
