import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link/link.dart';
import 'package:theprotestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:theprotestersoath/navigation/app_drawer/appdrawer_event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/stories/StoryModel.dart';
import 'package:theprotestersoath/stories/stories_cubit.dart';
import 'package:theprotestersoath/stories/stories_state.dart';

class StoryPage extends StatefulWidget {
  @override
  static Route route() {
    return MaterialPageRoute(builder: (_) => StoryPage());
  }

  @override
  _StoryPageState createState() => _StoryPageState();
}

class StoryContainer extends StatelessWidget {
  StoryContainer(this.story);

  final StoryModel story;

  @override
  Widget build(BuildContext context) {
    void _showErrorSnackBar() {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Oops... the URL couldn\'t be opened!'),
        ),
      );
    }

    return LayoutBuilder(builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return Container(
          color: Colors.grey[400],
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                  child: Column(children: <Widget>[
                    Container(
                        height: 500,
                        child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: <Widget>[
                            Container(
                                height: 300.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: AssetImage(story.imageURL),
                                    ))),
                            Align(
                              child: Center(
                                  child: Text(
                                    story.title,
                                    textScaleFactor: 1.3,
                                  )),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(story.credit),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Link(
                                  child: Text('Wikipedia Entry'),
                                  url: story.storyURL,
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
                                    Icons.list, //article_outlined,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  tooltip: 'STORIES_TOOLTIP'.tr(),
                                  onPressed: () => BlocProvider.of<AppDrawerBloc>(context).add(OathPageEvent()),
                                )))),
                  ]))));
    });
  }
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return CubitBuilder<StoriesCubit, StoriesState>(builder: (context, state) {
      if (state is LoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ErrorState) {
        return Center(
          child: Icon(Icons.close),
        );
      } else if (state is LoadedState) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                "STORIES".tr(),
                style: new TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.art_track, size: 40),
                  onPressed: () => CubitProvider.of<StoriesCubit>(context).getNextStory(),
                ),
              ],
              leading: IconButton(
                icon: Icon(Icons.turned_in),
                onPressed: () {
                  BlocProvider.of<AppDrawerBloc>(context).add(BackButtonEvent("StoryPage"));
                },
              ),
            ),
            body: StoryContainer(state.story)
        );
      }
    });
  }
}
