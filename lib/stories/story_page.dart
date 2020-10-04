import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:preferences/preference_service.dart';
// import 'package:global_configuration/global_configuration.dart';
import 'package:protestersoath/navigation/app_drawer.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:protestersoath/navigation/app_drawer/appdrawer_event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:protestersoath/stories/rss_page.dart';
import 'package:protestersoath/stories/stories_cubit.dart';
import 'package:protestersoath/stories/stories_state.dart';

import 'StoryCard.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final drawer = PrefService.getString('drawer', ignoreCache: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return CubitBuilder<StoriesCubit, StoriesState>(
              builder: (context, state) {
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
                      drawer: this.drawer == 'all' ? AppDrawer() : null,
                      body: Container(
                          color: Colors.grey,
                          child: CustomScrollView(slivers: <Widget>[
                                SliverAppBar(
                                  pinned: true,
                                  // expandedHeight: appBarHeight,
                                  title: Text(
                                    "STORIES".tr(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  actions: [
                                    IconButton(
                                      icon: Icon(Icons.art_track, size: 40),
                                      onPressed: () =>
                                          CubitProvider.of<StoriesCubit>(
                                              context).getNextStory(),
                                    ),
                                  ],
                                  leading: drawer == 'all' ? null :
                                  IconButton(
                                    icon: Icon(Icons.arrow_back),
                                    onPressed: () {
                                      BlocProvider.of<AppDrawerBloc>(context)
                                          .add(BackButtonEvent("StoryPage"));
                                    },
                                  ),
                                ),
                                SliverList(
                                  delegate: SliverChildListDelegate(
                                    [
                                      StoryCard(context, state.story),
                                    ],
                                  ),
                                )
                              ])));
                }
                return Center(
                  child: Icon(Icons.close),
                );
              });
        });
  }
}
