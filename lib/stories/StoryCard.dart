import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:link/link.dart';
import 'package:theprotestersoath/stories/StoryModel.dart';

class StoryCard extends StatelessWidget {
  StoryCard(this.story);

  final StoryModel story;

  @override
  Widget build(BuildContext context) {
    void _showErrorSnackBar() {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('URL_PROBLEM'.tr()),
        ),
      );
    }

    return SizedBox(

        height: 2700,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Container(
                height: 300.0,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
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
                  child: Text('STORY_URL_CAPTION'.tr()),
                  url: story.storyURL,
                  onError: _showErrorSnackBar,
                )
                // Text('STORY_01_URL'.tr()),
                ),
          ],
        ));
  }
}
