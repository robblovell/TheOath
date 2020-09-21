import 'dart:async';
import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';
import 'package:theprotestersoath/data/Token.dart';
import 'package:bloc/bloc.dart';
import './appdrawer.dart';

class AppDrawerBloc extends Bloc<AppDrawerEvent, AppDrawerState> {

  Token token;
  AppDrawerBloc()
      : super(LoadingState());

  // @override
  @override
  Stream<AppDrawerState> mapEventToState(AppDrawerEvent event,) async* {
    if (event is LoadingEvent) {
      dynamic tokenMap = await FlutterSession().get("token");
      this.token = Token.fromJson(tokenMap);
      print(token);
      yield HomePageState(this.token);
    }
    if (event is HomePageEvent || event is BackButtonEvent) {
      yield HomePageState(this.token);
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
  }
}

