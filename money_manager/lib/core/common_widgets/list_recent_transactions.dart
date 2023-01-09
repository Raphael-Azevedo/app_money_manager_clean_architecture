import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../features/home/presention/controller/home_controller.dart';

class RecentTransactions extends StatefulWidget {
  final HomeController controller;
  const RecentTransactions({required this.controller, super.key});

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Color.fromARGB(235, 230, 180, 247),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Transações Recentes',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 10),
          Observer(
            builder: ((_) => SizedBox(
                  height: 450,
                  child: ListView.builder(
                    itemCount: widget.controller.transactionList.length,
                    itemBuilder: ((context, index) => Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35))),
                          child: ListTile(
                            leading: (widget.controller.transactionList[index]
                                        .value >
                                    0)
                                ? const Icon(
                                    Icons.arrow_circle_up_sharp,
                                    color: Colors.green,
                                    size: 50,
                                  )
                                : const Icon(
                                    Icons.arrow_circle_down_sharp,
                                    color: Colors.red,
                                    size: 50,
                                  ),
                            title: Text(
                                widget.controller.transactionList[index].title),
                            subtitle: Text(widget
                                .controller.transactionList[index].description),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'R\$ ${widget.controller.transactionList[index].value.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: (widget
                                                  .controller
                                                  .transactionList[index]
                                                  .value >
                                              0)
                                          ? Colors.green
                                          : Colors.red),
                                ),
                                Text(DateFormat('dd/MM/yyyy').format(widget
                                    .controller.transactionList[index].date)),
                              ],
                            ),
                          ),
                        )),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
