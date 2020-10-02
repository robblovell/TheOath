import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protestersoath/authentication/authentication.dart';
import 'package:easy_localization/easy_localization.dart';

import 'MenuItem.dart';
import 'app_drawer/appdrawer_bloc.dart';
import 'app_drawer/appdrawer_event.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext theContext) {
    // final double paddingTop = MediaQuery.of(context).padding.top;
    return Drawer(
      child: Column(
        children: <Widget>[
          MediaQuery.removePadding(
            context: theContext,
            removeTop: true,
            child: Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 52),
                children: <Widget>[
                  MenuItem('HOME'.tr(), Icons.turned_in, () {
                    BlocProvider.of<AppDrawerBloc>(theContext)
                        .add(HomePageEvent());
                    Navigator.pop(theContext);
                  }),
                  MenuItem('VERIFY_OTHER'.tr(), Icons.open_in_full, () {
                    BlocProvider.of<AppDrawerBloc>(theContext)
                        .add(VerifyPageEvent());
                    Navigator.pop(theContext);
                  }),
                  MenuItem('THEOATH'.tr(), Icons.list, () {
                    BlocProvider.of<AppDrawerBloc>(theContext)
                        .add(OathPageEvent());
                    Navigator.pop(theContext);
                  }),
                  MenuItem('THEREASON'.tr(), Icons.info, () {
                    BlocProvider.of<AppDrawerBloc>(theContext)
                        .add(ReasonPageEvent());
                    Navigator.pop(theContext);
                  }),
                  MenuItem('STORIES'.tr(), Icons.art_track, () {
                    BlocProvider.of<AppDrawerBloc>(theContext)
                        .add(StoryPageEvent());
                    Navigator.pop(theContext);
                  }),
                  MenuItem('SETTINGS'.tr(), Icons.settings, () {
                    BlocProvider.of<AppDrawerBloc>(theContext)
                        .add(SettingsPageEvent());
                    Navigator.pop(theContext);
                  }),
                  MenuItem('ABOUT'.tr(), Icons.group, () {
                    BlocProvider.of<AppDrawerBloc>(theContext)
                        .add(AboutPageEvent());
                    Navigator.pop(theContext);
                  }),
                  MenuItem('LOGOUT'.tr(), Icons.exit_to_app, () {
                    theContext.bloc<AuthenticationBloc>().add(LoggedOut());
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
