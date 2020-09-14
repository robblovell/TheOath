import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theprotestersoath/authentication/authentication.dart';
import 'package:theprotestersoath/navigation/bloc/appdrawer_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'bloc/appdrawer_bloc.dart';
import 'bloc/appdrawer_event.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 50.0),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text('ABOUT_PAGE_MENU_ITEM'.tr()),
                    onTap: () {
                      BlocProvider.of<AppdrawerBloc>(context).add(AboutPageEvent());
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text("HOME".tr()),
                    onTap: () {
                      BlocProvider.of<AppdrawerBloc>(context).add(HomePageEvent());
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('LOGOUT'.tr()),
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
