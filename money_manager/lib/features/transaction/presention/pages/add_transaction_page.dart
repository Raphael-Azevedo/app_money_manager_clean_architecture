import 'package:flutter/material.dart';

import '../../../../core/dependency_injection/injection_container.dart';
import '../controller/transaction_controller.dart';
import '../widgets/adaptative_button.dart';
import '../widgets/adaptative_data_picker.dart';
import '../widgets/adaptative_text_field.dart';
import '../widgets/category_card.dart';

class AddTransactionPage extends StatefulWidget {
  static String route = 'add_transaction';
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  late final TransactionController controller;
  late final RouteSettings args;
  DateTime selecetedDate = DateTime.now();
  final categories = [
    {'name': 'Moradia', 'icon': Icons.home},
    {'name': 'Lanche', 'icon': Icons.fastfood_rounded},
    {'name': 'Alimentação', 'icon': Icons.restaurant},
    {'name': 'Transporte', 'icon': Icons.train},
    {'name': 'Vestuário', 'icon': Icons.shopify_rounded},
    {'name': 'Saúde', 'icon': Icons.favorite},
    {'name': 'Lazer', 'icon': Icons.pedal_bike_rounded},
    {'name': 'Educação', 'icon': Icons.menu_book_outlined},
    {'name': 'Segurança', 'icon': Icons.security},
    {'name': 'Outros', 'icon': Icons.work_outline_sharp},
  ];

  @override
  void initState() {
    super.initState();
    controller = sl<TransactionController>();
  }

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context)!.settings;
    super.didChangeDependencies();
  }

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
        title: const Text('Adicionar Transação'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 35),
                child: Row(
                  children: [
                    Text(
                      '\$',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controller.valueController,
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration:
                            const InputDecoration.collapsed(hintText: '0.00'),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Selecione a Categoria',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 45,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 5);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CategoryCard(
                            cardName: categories[index]['name'].toString(),
                            iconButton: categories[index]['icon'] as IconData);
                      },
                    ),
                  ),
                ],
              ),
              AdaptativeDataPicker(
                selecetedDate: selecetedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    selecetedDate = newDate;
                    controller.dateController = newDate;
                  });
                },
              ),
              AdaptativeTextField(
                  controller: controller.titleController,
                  onSubmitted: (_) {},
                  label: 'Título'),
              AdaptativeTextField(
                  controller: controller.descriptionController,
                  onSubmitted: (_) {},
                  label: 'Descrição'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton('Nova Transação', () {
                    if (args.arguments == true) {
                      controller.valueController.text =
                          "-${controller.valueController.text}";
                    }
                    controller.saveValues();
                    Navigator.of(context).pop();
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
