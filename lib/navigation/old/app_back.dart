import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_back/appback_event.dart';
import 'app_back/appback_bloc.dart';


class AppBarBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "About",
        style: new TextStyle(color: Colors.white),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          BlocProvider.of<AppBackBloc>(context).add(BackButtonEvent());
          Navigator.pop(context);
        },
      ),
    );
  }
}
