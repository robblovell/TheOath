import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theprotestersoath/authentication/authentication.dart';
import 'package:theprotestersoath/navigation/bloc/appdrawer_bloc.dart';

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
                padding: const EdgeInsets.only(top: 8.0),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text("Sample Page"),
                    onTap: () {
                      BlocProvider.of<AppdrawerBloc>(context).add(SamplePageEvent());
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text("Home"),
                    onTap: () {
                      BlocProvider.of<AppdrawerBloc>(context).add(HomePageEvent());
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Logout'),
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
