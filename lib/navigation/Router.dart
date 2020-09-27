// import 'package:protestersoath/home/home_page.dart';
// import 'package:protestersoath/login/LoginPage.dart';
// import 'package:protestersoath/splash/splash_page.dart';
// import 'package:flutter/material.dart';
// import 'package:protestersoath/stories/story_page.dart';
//
// import '../about/about_page.dart';
// import '../oath/oath_page.dart';
//
// const String LOGIN_PAGE = "/login";
// const String SPLASH_PAGE = "/splash";
// const String STORY_PAGE = "/story";
// const String OATH_PAGE = "/oath";
// const String HOME_PAGE = "/home";
// const String ABOUT_PAGE = "/about";
//
// class Router {
//
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case LOGIN_PAGE:
//         return MaterialPageRoute(
//             builder: (BuildContext context) =>
//                 LoginPage());
//       case HOME_PAGE:
//         return MaterialPageRoute(builder: (_) => HomePage());
//       case SPLASH_PAGE:
//         return MaterialPageRoute(builder: (_) => SplashPage());
//       case STORY_PAGE:
//         return MaterialPageRoute(builder: (_) => StoryPage());
//       case OATH_PAGE:
//         return MaterialPageRoute(builder: (_) => OathPage());
//       case ABOUT_PAGE:
//         return MaterialPageRoute(builder: (_) => AboutPage());
//       default:
//         return MaterialPageRoute(
//             builder: (_) => Scaffold(
//                   body: Center(
//                       child: Text('No route defined for ${settings.name}')),
//                 ));
//     }
//   }
// }
