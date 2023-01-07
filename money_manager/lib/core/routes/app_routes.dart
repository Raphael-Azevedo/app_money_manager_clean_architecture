// class AppRoutes {
//   static const home = '/';
//   static const transactions = '/transactions';
// }

import 'package:flutter/material.dart';

import '../../features/home/presention/pages/home_page.dart';

class AppRoutes {
  static Map<String, PageRouteBuilder> getPagesRoutes(RouteSettings settings) {
    return {
      HomePage.route: PageRouteBuilder(
        settings: settings,
        transitionDuration: const Duration(milliseconds: 0),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    };
  }
}
