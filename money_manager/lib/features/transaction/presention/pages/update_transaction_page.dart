import 'package:flutter/material.dart';
import 'package:money_manager/features/transaction/presention/widgets/adaptative_data_picker.dart';

import '../../../../core/common_widgets/app_drawer.dart';
import '../../../../core/dependency_injection/injection_container.dart';
import '../controller/transaction_controller.dart';

class UpdateTransactionPage extends StatefulWidget {
  static String route = 'update_transaction';
  const UpdateTransactionPage({super.key});

  @override
  State<UpdateTransactionPage> createState() => _UpdateTransactionPageState();
}

class _UpdateTransactionPageState extends State<UpdateTransactionPage> {
  late final TransactionController controller;
  DateTime selecetedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    controller = sl<TransactionController>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final RouteSettings args = ModalRoute.of(context)!.settings;
    final dynamic transaction = args.arguments;
    controller.titleController.text = transaction.title;
    controller.descriptionController.text = transaction.description;
    selecetedDate = transaction.date;
    controller.valueController.text = transaction.value.toString();
    _currentItemSelected = transaction.category;
    controller.idController.text = transaction.id;
  }

  final _categories = [
    'Moradia',
    'Lanche',
    'Alimentação',
    'Transporte',
    'Vestuário',
    'Saúde',
    'Lazer',
    'Educação',
    'Segurança',
    'Outros',
  ];
  String _currentItemSelected = 'Moradia';

  void _updateTransaction() {
    controller.categoryController = _currentItemSelected;
    controller.updateValues();
    controller.initializeController();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
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
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Valor da transação',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('R\$',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.valueController,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration:
                            const InputDecoration.collapsed(hintText: '0.00'),
                        validator: (value) {
                          if (value == "" || value == null) {
                            return 'Este campo é obrigatório!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        controller: controller.titleController,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.title_outlined),
                            labelText: 'Título'),
                        validator: (value) {
                          if (value == "" || value == null) {
                            return 'Este campo é obrigatório!';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        controller: controller.descriptionController,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.description),
                            labelText: 'Descrição'),
                        validator: (value) {
                          if (value == "" || value == null) {
                            return 'Este campo é obrigatório!';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: AdaptativeDataPicker(
                        selecetedDate: selecetedDate,
                        onDateChanged: (newDate) {
                          setState(() {
                            selecetedDate = newDate;
                            controller.dateController = newDate;
                          });
                        },
                      ),
                    ),
                    dropdownButton(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _updateTransaction();
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Container dropdownButton() {
    return Container(
      height: 150,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: const Text(
          'Selecione a Categoria: ',
          style: TextStyle(fontSize: 18),
        ),
        title: DropdownButton<String>(
          items: _categories.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),
          onChanged: (newValueSelected) {
            setState(() {
              _currentItemSelected = newValueSelected.toString();
            });
          },
          value: _currentItemSelected,
        ),
      ),
    );
  }
}
