import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:protestersoath/data/Token.dart';

import 'appdrawer_event.dart';

@immutable
abstract class AppDrawerState extends Equatable {}

class LoadingState extends AppDrawerState {
  @override
  List<Object> get props => [];
}

class DrawerEventState extends AppDrawerState {
  @override
  List<Object> get props => [];
}

class HomePageState extends AppDrawerState {
  Token token;
  HomePageState(Token token) {
    this.token = token;
  }
  @override
  List<Object> get props => [token];
}

class AboutPageState extends AppDrawerState {
  @override
  List<Object> get props => [];
}

class StoryPageState extends AppDrawerState {
  @override
  List<Object> get props => [];
}

class VerifyPageState extends AppDrawerState {
  @override
  List<Object> get props => [];
}

class ReasonPageState extends AppDrawerState {
  AppDrawerEvent lastPage;
  ReasonPageState(lastPage) {
    this.lastPage = lastPage;
  }

  @override
  List<Object> get props => [lastPage];
}
class PrivacyPageState extends AppDrawerState {
  AppDrawerEvent lastPage;
  PrivacyPageState(lastPage) {
    this.lastPage = lastPage;
  }

  @override
  List<Object> get props => [lastPage];
}
class OathPageState extends AppDrawerState {
  @override
  List<Object> get props => [];
}
class SettingsPageState extends AppDrawerState {
  @override
  List<Object> get props => [];
}
class VerifyProofOfOathState extends AppDrawerState {
  String othersPhone;
  VerifyProofOfOathState(othersPhone) {
    this.othersPhone = othersPhone;
  }
  @override
  List<Object> get props => [othersPhone];
}
