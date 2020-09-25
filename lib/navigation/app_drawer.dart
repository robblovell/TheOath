import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theprotestersoath/authentication/authentication.dart';
import 'package:easy_localization/easy_localization.dart';

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
                padding: const EdgeInsets.only(top: 40),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.list), //article_outlined),
                    title: Text(
                      "THEOATH".tr(),
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    onTap: () {
                      BlocProvider.of<AppDrawerBloc>(theContext)
                          .add(OathPageEvent());
                      Navigator.pop(theContext);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_back),
                    title: Text(
                      "THEREASON".tr(),
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    onTap: () {
                      BlocProvider.of<AppDrawerBloc>(theContext)
                          .add(ReasonPageEvent());
                      Navigator.pop(theContext);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.art_track),
                    title: Text(
                      "STORIES".tr(),
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    onTap: () {
                      BlocProvider.of<AppDrawerBloc>(theContext)
                          .add(StoryPageEvent());
                      Navigator.pop(theContext);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.turned_in),
                    title: Text(
                      "HOME".tr(),
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    onTap: () {
                      BlocProvider.of<AppDrawerBloc>(theContext)
                          .add(HomePageEvent());
                      Navigator.pop(theContext);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text(
                      'ABOUT'.tr(),
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    onTap: () {
                      BlocProvider.of<AppDrawerBloc>(theContext)
                          .add(AboutPageEvent());
                      Navigator.pop(theContext);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text(
                      'LOGOUT'.tr(),
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    onTap: () {
                      theContext.bloc<AuthenticationBloc>().add(LoggedOut());
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
