import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theprotestersoath/navigation/app_drawer/appdrawer_bloc.dart';
import 'package:theprotestersoath/navigation/app_drawer/appdrawer_event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:theprotestersoath/stories/StoryModel.dart';
import 'package:theprotestersoath/stories/stories_cubit.dart';
import 'package:theprotestersoath/stories/stories_state.dart';

import 'StoryCard.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class StoryContainer extends StatelessWidget {
  StoryContainer(this.story);

  final StoryModel story;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(shrinkWrap: false, slivers: <Widget>[
      // SliverAppBar(
      //   pinned: true,
      //   // expandedHeight: appBarHeight,
      //   flexibleSpace: FlexibleSpaceBar(
      //     titlePadding: EdgeInsets.zero,
      //     centerTitle: false,
      //     title: Text("REASON_TITLE".tr()),
      //   ),
      // ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 2700,
          child: Align(
            alignment: Alignment.topLeft,
            child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return Container(
                  height: 2700,
                  color: Colors.grey[400],
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                          child: Column(children: <Widget>[
                        StoryCard(story),
                        Expanded(
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    alignment: Alignment(0.9, 0.87),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.list,
                                        //article_outlined,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      tooltip: 'STORIES_TOOLTIP'.tr(),
                                      onPressed: () =>
                                          BlocProvider.of<AppDrawerBloc>(
                                                  context)
                                              .add(OathPageEvent()),
                                    )))),
                      ]))));
            }),
          ),
          // Text('The power of protest is to reveal truth in the face of unjust power through non-violent action.'),
        ),
      ),
    ]);
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
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.art_track, size: 40),
                  onPressed: () =>
                      CubitProvider.of<StoriesCubit>(context).getNextStory(),
                ),
              ],
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  BlocProvider.of<AppDrawerBloc>(context)
                      .add(BackButtonEvent("StoryPage"));
                },
              ),
            ),
            body: StoryContainer(state.story));
      }
      return Center(
        child: Icon(Icons.close),
      );
    });
  }
}
