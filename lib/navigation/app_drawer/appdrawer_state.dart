import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppDrawerState extends Equatable {}

class DrawerEventState extends AppDrawerState {
  @override
  List<Object> get props => [];
}

class HomePageState extends AppDrawerState {
  @override
  List<Object> get props => [];
}

class AboutPageState extends AppDrawerState {
  @override
  List<Object> get props => [];
}

class StoryPageState extends AppDrawerState {
  @override
  List<Object> get props => [];
}

class OathPageState extends AppDrawerState {
  @override
  List<Object> get props => [];
}