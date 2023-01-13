import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/features/transaction/presention/widgets/modal_bottom_sheet.dart';

import '../../features/transaction/presention/controller/transaction_controller.dart';

class RecentTransactions extends StatefulWidget {
  final TransactionController controller;
  final bool isHome;
  const RecentTransactions(this.isHome, {required this.controller, super.key});

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  List<dynamic> transactions = [];

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
            builder: ((_) {
              widget.isHome
                  ? (transactions = widget.controller.transactionList)
                  : (transactions = widget.controller.filteredList);
              return SizedBox(
                height: 450,
                child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: ((context, index) => Dismissible(
                          key: ValueKey(transactions[index]),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.error,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(35))),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 4,
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          confirmDismiss: (_) {
                            return showDialog<bool>(
                              context: context,
                              builder: ((ctx) => AlertDialog(
                                    title: const Text('Tem Certeza?'),
                                    content:
                                        const Text('Quer remover a Transação?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop(false);
                                        },
                                        child: const Text('Não'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop(true);
                                        },
                                        child: const Text('Sim'),
                                      ),
                                    ],
                                  )),
                            );
                          },
                          onDismissed: (_) {
                            // função para remover
                          },
                          child: GestureDetector(
                            onTap: (() {
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return ModalBottomSheet(
                                      transaction: transactions[index]);
                                },
                              );
                            }),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35))),
                              child: ListTile(
                                leading: (transactions[index].value > 0)
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
                                title: Text(transactions[index].title),
                                subtitle: Text(transactions[index].description),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'R\$ ${transactions[index].value.toStringAsFixed(2)}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: (transactions[index].value > 0)
                                              ? Colors.green
                                              : Colors.red),
                                    ),
                                    Text(DateFormat('dd/MM/yyyy')
                                        .format(transactions[index].date)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))),
              );
            }),
          ),
        ],
      ),
    );
  }
}
