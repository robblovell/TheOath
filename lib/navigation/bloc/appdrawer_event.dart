import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AppdrawerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomePageEvent extends AppdrawerEvent {
  HomePageEvent() : super();

  @override
  String toString() => 'HomePage';

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AboutPageEvent extends AppdrawerEvent {
  AboutPageEvent() : super();

  @override
  String toString() => 'AboutPage';

  @override
  // TODO: implement props
  List<Object> get props => [];
}

