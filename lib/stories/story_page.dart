import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link/link.dart';
import 'package:theprotestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:theprotestersoath/navigation/app_drawer/appdrawer_event.dart';
import 'package:easy_localization/easy_localization.dart';

class StoryPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => StoryPage());
  }

  @override
  Widget build(BuildContext context) {
    void _showErrorSnackBar() {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Oops... the URL couldn\'t be opened!'),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Stories",
            style: new TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.art_track, size: 40),
              onPressed: () =>
                  BlocProvider.of<AppDrawerBloc>(context).add(StoryPageEvent()),
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              BlocProvider.of<AppDrawerBloc>(context).add(BackButtonEvent());
            },
          ),
        ),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
              color: Colors.blue[100],
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                      child: Column(children: <Widget>[
                        Container(
                            height: 300,
                            child: ListView(
                              padding: const EdgeInsets.all(8),
                              children: <Widget>[
                                Container(
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                          fit: BoxFit.fitWidth,
                                          image: AssetImage(
                                              'assets/img/stories/story001.jpg'),
                                        ))),
                                Align(
                                  child: Center(child: Text('STORY_01'.tr(), textScaleFactor: 1.3, )),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text('STORY_01_CREDIT'.tr()),
                                ),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Link(
                                      child: Text('Wikipedia Entry'),
                                      url: 'STORY_01_URL'.tr(),
                                      onError: _showErrorSnackBar,
                                    )
                                    // Text('STORY_01_URL'.tr()),
                                    ),
                              ],
                            )),
                        Expanded(
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    alignment: Alignment(0.9, 0.87),
                                    child: IconButton(
                                      icon: new Icon(
                                        Icons.article_outlined,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      tooltip: 'STORIES_TOOLTIP'.tr(),
                                      onPressed: () =>
                                          BlocProvider.of<AppDrawerBloc>(context)
                                              .add(OathPageEvent()),
                                    )))),
                  ]))));
        }));
  }
}
