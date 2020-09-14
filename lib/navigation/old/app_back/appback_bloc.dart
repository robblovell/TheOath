import 'dart:async';
import 'package:bloc/bloc.dart';
import './appback.dart';

class AppBackBloc extends Bloc<AppBackEvent, AppBackState> {

  AppBackBloc()
      : super(HomePageState());

  // @override
  @override
  Stream<AppBackState> mapEventToState(AppBackEvent event,) async* {
    if (event is BackButtonEvent) {
      yield HomePageState();
    }
  }
}

