import 'package:flutter/material.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:money_manager/features/transaction/presention/pages/transaction_page.dart';

import '../../../../core/common_widgets/app_drawer.dart';
import '../../../../core/dependency_injection/injection_container.dart';
import '../controller/transaction_controller.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/home_card.dart';
import '../../../../core/common_widgets/list_recent_transactions.dart';

class HomePage extends StatefulWidget {
  static String route = 'home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TransactionController controller;

  @override
  void initState() {
    super.initState();
    controller = sl<TransactionController>();
    controller.initializeController();
  }

  @override
  Widget build(BuildContext context) {
    controller.buildContext = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeCard(controller: controller),
            const SizedBox(height: 20),
            RecentTransactions(true, controller: controller),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, TransactionPage.route);
        },
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
