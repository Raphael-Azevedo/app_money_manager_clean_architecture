import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../pages/update_transaction_page.dart';

class ModalBottomSheet extends StatelessWidget {
  final dynamic transaction;
  const ModalBottomSheet({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      height: 300,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: ListTile(
                leading: const Icon(
                  Icons.arrow_circle_up_outlined,
                  size: 40,
                  color: Colors.green,
                ),
                title: Text(
                  transaction.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Divider(thickness: 1),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.description),
                          title: const Text('Descrição '),
                          subtitle: Text(transaction.description),
                        ),
                        ListTile(
                          leading: const Icon(Icons.apps),
                          title: const Text('Categoria '),
                          subtitle: Text(transaction.category),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.calendar_month_outlined),
                          title: const Text('Data '),
                          subtitle: Text(DateFormat('dd/MM/yyyy')
                              .format(transaction.date)),
                        ),
                        ListTile(
                          leading: const Icon(Icons.payments_outlined),
                          title: const Text('Valor '),
                          subtitle: Text(
                              'R\$ ${transaction.value.toStringAsFixed(2)}'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, UpdateTransactionPage.route, arguments: transaction);
                },
                child: const Text('Editar Transação'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
