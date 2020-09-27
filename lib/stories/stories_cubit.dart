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
      var url = 'STORY_URL_' + index;
      final story = StoryModel(fn(date.tr()), fn(title.tr()), fn(summary.tr()),
          fn(body.tr()), fn(credit.tr()), fn(image.tr()), fn(url.tr()));
      emit(LoadedState(story));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
