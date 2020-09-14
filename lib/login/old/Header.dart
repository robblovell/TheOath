import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theprotestersoath/oath/OathContainer.dart';
import './TheOathHeader.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
          margin: EdgeInsets.fromLTRB(8, 35, 8, 8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TheOathHeader(),
                Expanded(flex: 1, child: TheOath())
              ])),
    );
  }
}
