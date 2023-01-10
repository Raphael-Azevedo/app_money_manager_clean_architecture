import 'package:flutter/material.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:money_manager/core/routes/app_routes.dart';
import 'package:money_manager/features/transaction/presention/pages/home_page.dart';

import 'core/helpers/main_material_app.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LifecycleObserver defaultifecycleObserver = LifecycleObserver();
  @override
  Widget build(BuildContext context) {
    MainMaterialApp.context = context;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.purple,
              secondary: const Color.fromRGBO(96, 126, 234, 100))),
      initialRoute: HomePage.route,
      routes: {HomePage.route: (context) => const HomePage()},
      onGenerateRoute: (settings) {
        return AppRoutes.getPagesRoutes(settings)[settings.name];
      },
      navigatorObservers: [defaultifecycleObserver],
      debugShowCheckedModeBanner: false,
    );
  }
}
