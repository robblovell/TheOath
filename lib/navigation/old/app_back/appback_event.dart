import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AppBackEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class BackButtonEvent extends AppBackEvent {
  BackButtonEvent() : super();

  @override
  String toString() => 'BackButton';

  @override
  List<Object> get props => [];
}

