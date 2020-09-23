import 'dart:async';
import 'package:flutter_session/flutter_session.dart';
import 'package:theprotestersoath/data/Token.dart';
import 'package:bloc/bloc.dart';
import './appdrawer.dart';
import 'appdrawer.dart';

class AppDrawerBloc extends Bloc<AppDrawerEvent, AppDrawerState> {
  Token token;
  AppDrawerEvent lastPage;
  AppDrawerEvent currentPage;

  AppDrawerBloc() : super(LoadingState());

  // @override
  @override
  Stream<AppDrawerState> mapEventToState(
    AppDrawerEvent event,
  ) async* {
    this.lastPage = this.currentPage;
    this.currentPage = event;
    if (event is LoadingEvent) {
      dynamic tokenMap = await FlutterSession().get("token");
      this.token = Token.fromJson(tokenMap);
      print(token);
      yield HomePageState(this.token);
    }
    if (event is HomePageEvent) {
      dynamic tokenMap = await FlutterSession().get("token");
      this.token = Token.fromJson(tokenMap);
      print(token);
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
      yield ReasonPageState(this.lastPage);
    }
    if (event is BackButtonEvent) {
      dynamic tokenMap = await FlutterSession().get("token");
      this.token = Token.fromJson(tokenMap);
      print(token);
      // todo: handle the differences for the Reason page. sometimes it goes back to oath.
      yield HomePageState(this.token);
    }
    if (event is ReasonBackButtonEvent) {
      yield LoadingState();
      backFromReason(event.toPageEvent).listen((event) {
        add(event);
      });
    }
  }

  Stream<AppDrawerEvent> backFromReason(event) async* {
    StreamController<AppDrawerEvent> eventStream = StreamController();
    eventStream.add(event);
    await eventStream.close();
    yield* eventStream.stream;
  }
}
