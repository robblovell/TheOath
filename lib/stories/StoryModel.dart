import 'package:webfeed/domain/rss_item.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class StoryModel {
  String date;
  String title;
  String summary;
  String body;
  String credit;
  String imageURL;
  String referenceURL;
  String postURL;
  bool isHTML;

  StoryModel(
      {this.date,
      this.title,
      this.summary,
      this.body,
      this.credit,
      this.imageURL,
      this.referenceURL,
      this.postURL,
      this.isHTML = false});

  StoryModel.fromRSSFeed(RssItem item) {
    try {
      final document = parse(item.content.value.trim());

      String caption = document
          .getElementsByTagName("figcaption")
          .isNotEmpty
          ? document
          .getElementsByTagName("figcaption")
          .elementAt(0)
          .innerHtml
          : '';

      String date = '', credit = '', url = '', link = '';
      if (document.getElementsByTagName("meta").isNotEmpty) {
        List<Element> meta = document.getElementsByTagName("meta");
        date = meta.elementAt(0).attributes['date'];
        credit = meta.elementAt(0).attributes['credit'];
        url = meta.elementAt(0).attributes['url'];
      }
      String body = '';
      if (document.getElementsByTagName("p").isNotEmpty) {
        List<Element> bodyHtml = document.getElementsByTagName("p");
        Iterable<String> bodyMap = bodyHtml.map((element) => element.innerHtml);
        body =bodyMap.reduce((value, element) =>
            value + '<p>' + element + '</p>');
      }

      this.date = date.toString();
      this.title = item.title;
      this.summary = caption;
      this.body = body;
      this.credit = credit;
      this.imageURL = item.content.images.isNotEmpty
          ? item.content.images.elementAt(0)
          : 'assets/img/protester.png';
      this.referenceURL = url;
      this.postURL = item.link;
      this.isHTML = true;
    } catch (e) {
      print(e.toString());
    }
  }
}
/*

<figure class="wp-block-image size-large is-resized">
<img loading="lazy" src="https://protestersoath.com/wp-content/uploads/2020/10/story000-1024x556.jpg"
alt="" class="wp-image-26" width="610" height="331"
srcset="https://protestersoath.com/wp-content/uploads/2020/10/story000-1024x556.jpg 1024w,
https://protestersoath.com/wp-content/uploads/2020/10/story000-300x163.jpg 300w,
https://protestersoath.com/wp-content/uploads/2020/10/story000-768x417.jpg 768w,
https://protestersoath.com/wp-content/uploads/2020/10/story000-1200x652.jpg 1200w,
https://protestersoath.com/wp-content/uploads/2020/10/story000.jpg 1414w"
sizes="(max-width: 610px) 100vw, 610px" />
<figcaption>A menorah is displayed in a window in defiance of Nazi politics. <br>(Photo 12/Universal Images Group via Getty Images)</figcaption>
</figure>

<p>One month before Hitler rose to power, a Jewish family living in Germany defiantly displayed a Hanukkah menorah in their window across from a Nazi flag.</p>

<meta name="date" content="1932">
<meta credit="Photo 12/Universal Images Group via Getty Images">
<meta url="https://en.wikipedia.org/wiki/The_Holocaust">

 */
