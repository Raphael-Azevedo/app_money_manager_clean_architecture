import 'package:flutter/material.dart';

import '../../../../core/common_widgets/app_drawer.dart';

class UpdateTransactionPage extends StatelessWidget {
  static String route = 'update_transaction';
  const UpdateTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Editar Transação'),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text("LA ELE"),
      ),
    );
  }
}
