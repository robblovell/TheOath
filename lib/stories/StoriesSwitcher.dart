import 'package:flutter/cupertino.dart';
import 'package:preferences/preference_service.dart';
import 'package:protestersoath/stories/rss_page.dart';
import 'package:protestersoath/stories/story_page.dart';

class StoriesSwitcher extends StatelessWidget {
  StoriesSwitcher();

  final stories = PrefService.getString('stories', ignoreCache: true);

  // static Route route() {
  //   return MaterialPageRoute(builder: (_) => ReasonPage(this.isLogin));
  // }

  @override
  Widget build(BuildContext context) {
    if (this.stories == "feeds") {
      return RSSReader();
    }
    else {
      return StoryPage();
    }
  }

}
