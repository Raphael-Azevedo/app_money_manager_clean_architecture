import 'package:flutter/material.dart';
import 'package:money_manager/features/transaction/presention/widgets/bar_chart_transaction.dart';
import 'package:money_manager/core/common_widgets/list_recent_transactions.dart';
import 'package:money_manager/features/transaction/presention/widgets/segmented_control_transaction.dart';

import '../../../../core/common_widgets/app_drawer.dart';
import '../../../../core/dependency_injection/injection_container.dart';
import '../controller/transaction_controller.dart';
import '../../../../core/common_widgets/app_button.dart';
import '../widgets/bottom_navigation.dart';

class TransactionPage extends StatefulWidget {
  static String route = 'transactions';
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
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
    List<Tuple2<Color, String>> items = [
      Tuple2(const Color.fromRGBO(168, 47, 225, 1), "Gastos"),
      Tuple2(const Color.fromARGB(253, 86, 74, 202), "Entrada"),
      Tuple2(const Color.fromARGB(255, 21, 123, 170), "Total"),
    ];

    return Scaffold(
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
                  isCost: false,
                ),
                AppButton(
                  text: 'Adicionar Gasto',
                  iconButton: Icons.remove_circle_outline,
                  isCost: true,
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: BarChartTransaction(controller: controller)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items.map((item) {
                return Row(
                  children: [
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: item.item1,
                    ),
                    const SizedBox(width: 8),
                    Text(item.item2),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            const SegmentedControlTransaction(currentSelection: 0),
            const SizedBox(height: 20),
            RecentTransactions(false, controller: controller),
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
    );
  }
}

class Tuple2<A, B> {
  final A item1;
  final B item2;

  Tuple2(this.item1, this.item2);
}
