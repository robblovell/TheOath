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

class SettingsPageEvent extends AppDrawerEvent {
  SettingsPageEvent() : super();

  @override
  String toString() => 'SettingsPage';

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
class VerifyPageEvent extends AppDrawerEvent {
  VerifyPageEvent() : super();

  @override
  String toString() => 'VerifyPage';

  @override
  List<Object> get props => [];
}

class PrivacyPageEvent extends AppDrawerEvent {
  PrivacyPageEvent() : super();

  @override
  String toString() => 'PrivacyPage';

  @override
  List<Object> get props => [];
}
class ReasonBackButtonEvent extends AppDrawerEvent {
  AppDrawerEvent toPageEvent;
  ReasonBackButtonEvent(this.toPageEvent) : super();

  @override
  String toString() => 'ReasonBackButton';

  @override
  List<Object> get props => [this.toPageEvent];
}
class PrivacyBackButtonEvent extends AppDrawerEvent {
  AppDrawerEvent toPageEvent;
  PrivacyBackButtonEvent(this.toPageEvent) : super();

  @override
  String toString() => 'PrivacyBackButton';

  @override
  List<Object> get props => [this.toPageEvent];
}
class BackButtonEvent extends AppDrawerEvent {
  String fromPage;
  BackButtonEvent(this.fromPage) : super();

  @override
  String toString() => 'BackButton';

  @override
  List<Object> get props => [this.fromPage];
}

class VerifyProofOfOathEvent extends AppDrawerEvent {
  VerifyProofOfOathEvent({@required this.othersPhone}) : super();
  final String othersPhone;

  @override
  String toString() => 'VerifyProofOfOath { othersPhone: $othersPhone }';

  @override
  List<Object> get props => [othersPhone];
}
