import 'dart:async';
import 'package:bloc/bloc.dart';
import './appdrawer.dart';

class AppDrawerBloc extends Bloc<AppDrawerEvent, AppDrawerState> {

  AppDrawerBloc()
      : super(HomePageState());

  // @override
  @override
  Stream<AppDrawerState> mapEventToState(AppDrawerEvent event,) async* {
    if (event is HomePageEvent) {
      yield HomePageState();
    }
    if (event is AboutPageEvent) {
      yield AboutPageState();
    }
    if (event is StoryPageEvent) {
      yield StoryPageState();
    }
    if (event is OathPageEvent) {
      yield OathPageState();
    }
    if (event is ReasonPageEvent) {
      yield ReasonPageState();
    }
    if (event is BackButtonEvent) {
      yield HomePageState();
    }
  }
}

