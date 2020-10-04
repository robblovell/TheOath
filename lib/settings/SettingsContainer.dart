import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

// import 'package:preferences/dropdown_preference.dart';
import 'package:preferences/preference_page.dart';
import 'package:preferences/preference_service.dart';
import 'package:preferences/preference_title.dart';
import 'package:preferences/radio_preference.dart';

class SettingsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PreferencePage([
        // PreferenceTitle('General'),
        // DropdownPreference(
        //   'Start Page',
        //   'start_page',
        //   defaultVal: 'Timeline',
        //   values: ['Posts', 'Timeline', 'Private Messages'],
        // ),
        PreferenceTitle('SETTINGS_MENU_CONFIG'.tr()),
        RadioPreference(
          'SETTINGS_MENU_OPTION1'.tr(),
          'home',
          'drawer',
          isDefault: true,
        ),
        RadioPreference(
          'SETTINGS_MENU_OPTION2'.tr(),
          'all',
          'drawer',
        ),
        RadioPreference(
          'SETTINGS_MENU_OPTION3'.tr(),
          'none',
          'drawer',
        ),
        PreferenceTitle('SETTINGS_STORIES_CONFIG'.tr()),
        RadioPreference(
          'SETTINGS_STORIES_OPTION2'.tr(),
          'pages',
          'stories',
          isDefault: true,
        ),
        RadioPreference(
          'SETTINGS_STORIES_OPTION1'.tr(),
          'feeds',
          'stories',
        ),
      ]),
    );
  }
}
