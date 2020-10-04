import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:link/link.dart';
import 'package:protestersoath/stories/StoryModel.dart';


Widget RSSCard(BuildContext context, StoryModel story, openFeed) {
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
        story.imageURL.startsWith("assets")
            ? Image.asset(story.imageURL)
            : Image.network(story.imageURL),
        // Title and Summary
        ListTile(
                leading: Icon(Icons.arrow_drop_down_circle),
                title: Text(story.title, style: TextStyle(fontSize: 20)),
                subtitle: Html(data: story.summary), //Text(story.summary, style: TextStyle(fontSize: 10)),
                isThreeLine: false,
                onTap: () => openFeed(story.postURL),
              ),

        // Date of the story

        // The story
        (story.body != '')
            ? Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 0, bottom: 5),
                child: story.isHTML
                    ? Html(data: story.body)
                    : Text(
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
                child: Text(story.referenceURL, style: TextStyle(fontSize: 10)),
                url: story.referenceURL,
                onError: _showErrorSnackBar,
              ),
            )),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(top: 3, bottom: 3, right: 10),
            child: Text(
              'Photo: ' + story.credit,
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(top: 3, bottom: 20, right: 10),
            child: Text(
              'Date: ' + story.date,
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
      ],
    ),
  );
}
