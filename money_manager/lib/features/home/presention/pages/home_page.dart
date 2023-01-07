import 'package:flutter/material.dart';
import 'package:lifecycle/lifecycle.dart';

import '../../../../core/dependency_injection/injection_container.dart';
import '../controller/home_controller.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/home_card.dart';
import '../widgets/list_recent_transactions.dart';

class HomePage extends StatefulWidget {
  static String route = 'home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = sl<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    controller.buildContext = context;

    return LifecycleWrapper(
      onLifecycleEvent: (event) async {
        if (event == LifecycleEvent.visible) {
          await controller.initializeController();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Despesas Pessoais'),
        ),
        drawer: const Drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeCard(controller: controller),
              RecentTransactions(controller: controller),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

  //  bottomNavigationBar: Observer(
  //         builder: (_) => CowInfoBottomAppBar(
  //           showCalfCloud: widget.controller.showCalfCloudButton,
  //           onCalfCloudPressed: () {
  //             Navigator.pushNamed(context, CalfCloudPage.route,
  //                 arguments: widget.controller.cowInfoAnimal!.id);
  //           },
  //           onPenHistoryPressed: () {
  //             Navigator.pushNamed(context, PenHistoryPage.route,
  //                 arguments: widget.controller.cowInfoAnimal!.id);
  //           },
  //           onGroupViewPressed: () {
  //             Navigator.pushNamed(context, GroupViewPage.route,
  //                 arguments: widget.controller.cowInfoAnimal!.penId);
  //           },
  //           onTimelinePressed: () {
  //             scaffoldKey.currentState!.openEndDrawer();
  //           },
  //         ),
  //       ),