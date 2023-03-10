import 'package:flutter/material.dart';
import 'package:money_manager/features/transaction/presention/pages/add_transaction_page.dart';
import 'package:money_manager/features/transaction/presention/pages/transaction_page.dart';
import 'package:money_manager/features/transaction/presention/pages/update_transaction_page.dart';

import '../../features/transaction/presention/pages/home_page.dart';

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
      TransactionPage.route: PageRouteBuilder(
        settings: settings,
        transitionDuration: const Duration(milliseconds: 0),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const TransactionPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
      AddTransactionPage.route: PageRouteBuilder(
        settings: settings,
        transitionDuration: const Duration(milliseconds: 0),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AddTransactionPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
      UpdateTransactionPage.route: PageRouteBuilder(
        settings: settings,
        transitionDuration: const Duration(milliseconds: 0),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const UpdateTransactionPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    };
  }
}
