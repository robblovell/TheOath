import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:theprotestersoath/data/Token.dart';

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

class ReasonPageState extends AppDrawerState {
  @override
  List<Object> get props => [];
}

class OathPageState extends AppDrawerState {
  @override
  List<Object> get props => [];
}