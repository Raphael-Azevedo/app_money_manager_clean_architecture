import 'package:flutter/material.dart';

import '../pages/update_transaction_page.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({super.key});

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
              child: const ListTile(
                leading: Icon(
                  Icons.arrow_circle_up_outlined,
                  size: 40,
                  color: Colors.green,
                ),
                title: Text(
                  "Titulo",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Divider(thickness: 1),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: const [
                        ListTile(
                          leading: Icon(Icons.description),
                          title: Text('Descrição '),
                          subtitle: Text('Teste '),
                        ),
                        ListTile(
                          leading: Icon(Icons.apps),
                          title: Text('Categoria '),
                          subtitle: Text('Teste '),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        ListTile(
                          leading: Icon(Icons.calendar_month_outlined),
                          title: Text('Data '),
                          subtitle: Text('13 jan 2023'),
                        ),
                        ListTile(
                          leading: Icon(Icons.payments_outlined),
                          title: Text('Valor '),
                          subtitle: Text('\$500.00'),
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
                  Navigator.pushNamed(context, UpdateTransactionPage.route);
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
