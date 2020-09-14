import 'package:flutter/material.dart';
import 'package:local_image_provider/local_image_provider.dart';

import '../navigation/app_drawer.dart';

class AboutPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => AboutPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 190.0,
              height: 190.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/img/robb.png'),
                  )
              )),
          Container(height: 5),
          Text('Made by: Robb E Lovell',textScaleFactor: 1.5,),
          Container(height: 50),
          Container(
              width: 190.0,
              height: 190.0,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/img/flutter_logo_transparent.png'),
                  )
              )),
          Text('Powered by: Flutter',textScaleFactor: 1.5,)
        ],
      )),
    );
  }
}
