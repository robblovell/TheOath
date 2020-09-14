import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppBackState extends Equatable {}

class BackEventState extends AppBackState {
  @override
  List<Object> get props => [];
}

class HomePageState extends AppBackState {
  @override
  List<Object> get props => [];
}

class AboutPageState extends AppBackState {
  @override
  List<Object> get props => [];
}