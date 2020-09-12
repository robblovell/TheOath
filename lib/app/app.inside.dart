// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// import 'package:theprotestersoath/home/home_page.dart';
// import 'package:theprotestersoath/drawer/drawer/blocs.dart';
// import 'package:theprotestersoath/drawer/drawer_widget.dart';
//
// class AppInside extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<DrawerBloc>(
//       create: (BuildContext context) => DrawerBloc(),
//       child: BlocBuilder<DrawerBloc, DrawerState>(
//         builder: (BuildContext context, DrawerState state) =>
//             Scaffold(
//                 drawer: DrawerWidget("Joe Shmoe", "shmoe@joesemail.com"),
//                 appBar: AppBar(
//                   title: Text('Hello'),
//                 ),
//                 body: _bodyForState(state),
//                 floatingActionButton: _getFabForItem(state.selectedItem)),
//       ),
//     );
//   }
// }