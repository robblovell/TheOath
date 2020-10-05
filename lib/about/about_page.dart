import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preferences/preference_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:protestersoath/navigation/app_drawer.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_event.dart';

import '../res.dart';

class AboutPage extends StatelessWidget {
  // static Route route() {
  //   return MaterialPageRoute(builder: (_) => AboutPage());
  // }
  final drawer = PrefService.getString('drawer', ignoreCache: true);

  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;

    double height = MediaQuery.of(context).size.height - appBarHeight;
    double textHeight = height * 0.5;
    return Scaffold(
        drawer: this.drawer == 'all' ? AppDrawer() : null,
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            "About",
            style: TextStyle(color: Colors.white),
          ),
          leading: this.drawer == 'all'
              ? null
              : IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    BlocProvider.of<AppDrawerBloc>(context)
                        .add(BackButtonEvent("AboutPage"));
                  },
                ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: textHeight,
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'REASON0'.tr(),
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(Res.trinity),
                            )))),
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage(Res.logo_flutter_transparent),
                            )))),
              ],
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Made by 3Jane',
                    textScaleFactor: 1.5,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Powered by Flutter',
                    textScaleFactor: 1.5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
