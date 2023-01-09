import 'package:flutter/material.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:money_manager/features/home/presention/widgets/bar_chart_transaction.dart';
import 'package:money_manager/core/common_widgets/list_recent_transactions.dart';
import 'package:money_manager/features/home/presention/widgets/segmented_control_transaction.dart';

import '../../../../core/common_widgets/app_drawer.dart';
import '../../../../core/dependency_injection/injection_container.dart';
import '../controller/home_controller.dart';
import '../../../../core/common_widgets/app_button.dart';
import '../widgets/bottom_navigation.dart';

class TransactionPage extends StatefulWidget {
  static String route = 'transactions';
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
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
          title: const Text('Transações'),
        ),
        drawer: const AppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  AppButton(
                    text: 'Adicionar Entrada',
                    iconButton: Icons.add_circle_outline,
                  ),
                  AppButton(
                    text: 'Adicionar Gasto',
                    iconButton: Icons.remove_circle_outline,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: BarChartTransaction(controller: controller)),
              const SizedBox(height: 30),
              const SegmentedControlTransaction(currentSelection: 0),
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
