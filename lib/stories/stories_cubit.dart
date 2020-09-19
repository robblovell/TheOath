import 'package:easy_localization/easy_localization.dart';
import 'package:cubit/cubit.dart';
import 'StoryModel.dart';
import 'stories_state.dart';

class StoriesCubit extends Cubit<StoriesState> {
  StoriesCubit() : super(InitialState()) {
    getNextStory();
  }

  final stories = 4;
  static int which = -1;

  void getNextStory() async {
    try {
      emit(LoadingState());
      which = (which + 1) % this.stories;
      var f = new NumberFormat("00", "en_US");
      var index = f.format(which);
      var date = 'STORY_DATE_'+index;
      var title = 'STORY_'+index;
      var credit = 'STORY_CREDIT_'+index;
      var image = 'STORY_IMAGE_'+index;
      var url = 'STORY_URL_'+index;
      final story = StoryModel(date.tr(),title.tr(),credit.tr(),image.tr(),url.tr());
      emit(LoadedState(story));
    } catch (e) {
      emit(ErrorState());
    }
  }
}