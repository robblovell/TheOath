import 'package:bloc/bloc.dart';
import 'blocs.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {

  DrawerBloc() : super(DrawerState(DrawerItem.page_one));

  @override
  Stream<DrawerState> mapEventToState(DrawerEvent event) async* {
    if (event is NavigateTo) {
      if (event.destination != state.selectedItem) {
        yield DrawerState(event.destination);
      }
    }
  }
}
