import 'package:easy_localization/easy_localization.dart';
import 'package:cubit/cubit.dart';
import 'StoryModel.dart';
import 'stories_state.dart';

class StoriesCubit extends Cubit<StoriesState> {
  StoriesCubit() : super(InitialState()) {
    getNextStory();
  }

  final stories = 6;
  static int which = -1;

  fn(string) {
    return string == null || string.startsWith("STORY_")? '' : string;
  }

  void getNextStory() async {
    try {
      emit(LoadingState());
      which = (which + 1) % this.stories;
      var f = NumberFormat("00", "en_US");
      var index = f.format(which);
      var title = 'STORY_TITLE_' + index;
      var summary = 'STORY_SUMMARY_' + index;
      var body = 'STORY_' + index;
      var date = 'STORY_DATE_' + index;
      var credit = 'STORY_CREDIT_' + index;
      var image = 'STORY_IMAGE_' + index;
      var postURL = 'STORY_URL_' + index;
      var referenceURL = 'STORY_URL_' + index;
      final story = StoryModel(
          date: fn(date.tr()),
          title: fn(title.tr()),
          summary: fn(summary.tr()),
          body: fn(body.tr()),
          credit: fn(credit.tr()),
          imageURL: fn(image.tr()),
          referenceURL: fn(referenceURL.tr()),
          postURL: fn(postURL.tr()),
          isHTML: false,);
      emit(LoadedState(story));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
