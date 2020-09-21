import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theprotestersoath/authentication/authentication.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/utils/sizing.dart';

import 'app_drawer/appdrawer_bloc.dart';
import 'app_drawer/appdrawer_event.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final double paddingTop = MediaQuery.of(context).padding.top;
    return Drawer(
      child: Column(
        children: <Widget>[
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 40),
                children: <Widget>[

                  ListTile(
                    leading: Icon(Icons.list), //article_outlined),
                    title: Text("THEOATH".tr(),
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    onTap: () {
                      BlocProvider.of<AppDrawerBloc>(context).add(OathPageEvent());
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("THEREASON".tr(),
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    onTap: () {
                      BlocProvider.of<AppDrawerBloc>(context).add(ReasonPageEvent());
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.art_track),
                    title: Text("STORIES".tr(),
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    onTap: () {
                      BlocProvider.of<AppDrawerBloc>(context).add(StoryPageEvent());
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.turned_in),
                    title: Text("HOME".tr(),
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    onTap: () {
                      BlocProvider.of<AppDrawerBloc>(context).add(HomePageEvent());
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text('ABOUT'.tr(),
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    onTap: () {
                      BlocProvider.of<AppDrawerBloc>(context).add(AboutPageEvent());
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('LOGOUT'.tr(),
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    onTap: () {
                      context
                          .bloc<AuthenticationBloc>()
                          .add(LoggedOut());
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
