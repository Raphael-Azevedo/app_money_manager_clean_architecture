import 'package:flutter/material.dart';

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
  DateTime selecetedDate = DateTime.now();
  final _titleController = TextEditingController();

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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoryCard(cardName: 'Moradia', iconButton: Icons.home),
                    CategoryCard(
                        cardName: 'Lanche', iconButton: Icons.fastfood_rounded),
                    CategoryCard(
                        cardName: 'Alimentação', iconButton: Icons.restaurant),
                    CategoryCard(
                        cardName: 'Transporte', iconButton: Icons.train),
                    CategoryCard(
                        cardName: 'Vestuário',
                        iconButton: Icons.shopify_rounded),
                    CategoryCard(cardName: 'Saúde', iconButton: Icons.favorite),
                    CategoryCard(
                        cardName: 'Lazer',
                        iconButton: Icons.pedal_bike_rounded),
                    CategoryCard(
                        cardName: 'Educação',
                        iconButton: Icons.menu_book_outlined),
                    CategoryCard(
                        cardName: 'Segurança', iconButton: Icons.security),
                    CategoryCard(
                        cardName: 'Outros',
                        iconButton: Icons.work_outline_sharp),
                  ],
                ),
              ),
              AdaptativeDataPicker(
                selecetedDate: selecetedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    selecetedDate = newDate;
                  });
                },
              ),
              AdaptativeTextField(
                  controller: _titleController,
                  onSubmitted: (_) {}, // _submitForm(),
                  label: 'Descrição'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                      'Nova Transação',
                      // _submitForm,
                      () {})
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
