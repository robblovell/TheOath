import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AppDrawerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingEvent extends AppDrawerEvent {
  @override
  List<Object> get props => [];
}

class HomePageEvent extends AppDrawerEvent {
  HomePageEvent() : super();

  @override
  String toString() => 'HomePage';

  @override
  List<Object> get props => [];
}

class AboutPageEvent extends AppDrawerEvent {
  AboutPageEvent() : super();

  @override
  String toString() => 'AboutPage';

  @override
  List<Object> get props => [];
}

class StoryPageEvent extends AppDrawerEvent {
  StoryPageEvent() : super();

  @override
  String toString() => 'StoryPage';

  @override
  List<Object> get props => [];
}

class OathPageEvent extends AppDrawerEvent {
  OathPageEvent() : super();

  @override
  String toString() => 'OathPage';

  @override
  List<Object> get props => [];
}

class ReasonPageEvent extends AppDrawerEvent {
  ReasonPageEvent() : super();

  @override
  String toString() => 'ReasonPage';

  @override
  List<Object> get props => [];
}


class BackButtonEvent extends AppDrawerEvent {
  BackButtonEvent() : super();

  @override
  String toString() => 'BackButton';

  @override
  List<Object> get props => [];
}

