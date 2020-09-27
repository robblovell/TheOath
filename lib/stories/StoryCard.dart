import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:link/link.dart';
import 'package:protestersoath/stories/StoryModel.dart';

Widget StoryCard(BuildContext context, StoryModel story) {
  void _showErrorSnackBar() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('URL_PROBLEM'.tr()),
      ),
    );
  }

  return Card(
    clipBehavior: Clip.antiAlias,
    color: Colors.grey[400],
    child: Column(
      children: [
        Image.asset(story.imageURL),
        // Title and Summary
        (story.summary == '') ?
        ListTile(
          leading: Icon(Icons.arrow_drop_down_circle),
          title:
              // Text(story.title),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(story.title, style: TextStyle(fontSize: 20)),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(story.date, style: TextStyle(fontSize: 10))),
            ],
          ),

          isThreeLine: false,
        ):ListTile(
          leading: Icon(Icons.arrow_drop_down_circle),
          title:
          // Text(story.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(story.title, style: TextStyle(fontSize: 20)),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(story.date, style: TextStyle(fontSize: 10))),
            ],
          ),
          subtitle: Text(
            story.summary,
            style:
            TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.8)),
          ),
          isThreeLine: true,
        ),
        // Date of the story

        // The story
        (story.body != '')
            ? Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 10, top: 0, bottom: 5),
                child: Text(
                  story.body,
                  style: TextStyle(
                      fontSize: 15, color: Colors.black.withOpacity(0.8)),
                ),
              )
            : Container(),

        // Credits

        // link to the story.
        Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(top: 3, bottom: 3, right: 10),
              child: Link(
                child: Text(story.storyURL, style: TextStyle(fontSize: 10)),
                url: story.storyURL,
                onError: _showErrorSnackBar,
              ),
            )),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(top: 3, bottom: 20, right: 10),
            child: Text(
              'Photo: ' + story.credit,
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
      ],
    ),
  );
}
