import 'package:flutter/material.dart';

import '../res.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset(
          Res.protester,
          width: 350,
          height:  350,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
