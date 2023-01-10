import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/features/transaction/domain/usecases/add_transaction.dart';
import 'package:money_manager/features/transaction/domain/usecases/get_month_transaction_list.dart';
import 'package:money_manager/features/transaction/domain/usecases/get_year_transaction_list.dart';

import '../../../../core/dependency_injection/injection_container.dart';
import '../../data/models/transaction_model.dart';
import '../../domain/entities/transactions.dart';

part 'transaction_controller.g.dart';

// ignore: library_private_types_in_public_api
class TransactionController = _TransactionControllerBase
    with _$TransactionController;

abstract class _TransactionControllerBase with Store {
  late final GetMonthTransactionList getMonthTransactionListUseCase;
  late final GetYearTransactionList getYearTransactionListUseCase;
  late final AddTransaction addTransactionUseCase;

  final valueController = TextEditingController();
  final descriptionController = TextEditingController();
  final titleController = TextEditingController();
  DateTime dateController = DateTime.now();
  String categoryController = '';

  BuildContext? buildContext;

  @observable
  bool isBusy = false;

  @observable
  double valueTotal = 0;

  @observable
  double valueEntrance = 0;

  @observable
  double valueCost = 0;

  @observable
  late Map<String, dynamic> chartBar = {};

  @observable
  late List<Transaction> transactionList = [];

  @observable
  late List<Transaction> allTransactionList = [];

  _TransactionControllerBase(
      {required this.getMonthTransactionListUseCase,
      required this.getYearTransactionListUseCase,
      required this.addTransactionUseCase});

  Future<void> initializeController() async {
    await Future.wait([
      getMonthTransactionList(),
      getAllTransactions(),
    ]);
  }

  @action
  Future<void> getMonthTransactionList() async {
    final result = await getMonthTransactionListUseCase(sl());
    result!.fold((l) {}, (r) {
      transactionList = ObservableList.of(r);
      valueTotal = 0;
      valueEntrance = 0;
      valueCost = 0;
      for (var e in transactionList) {
        valueTotal = e.value + valueTotal;
        if (e.value > 0) {
          valueEntrance += e.value;
        } else {
          valueCost -= e.value;
        }
      }
    });
  }

  @action
  Future<void> getAllTransactions() async {
    final result = await getYearTransactionListUseCase(sl());
    result!.fold((l) {}, (r) {
      allTransactionList = ObservableList.of(r);
      chartBar = {};
      chartBar = _agroupTransactionsPerMes(allTransactionList, chartBar);
    });
  }

  Map<String, dynamic> _agroupTransactionsPerMes(
      List transacoes, Map<String, dynamic> meses) {
    for (var transacao in transacoes) {
      String mes = DateFormat.MMMM().format(transacao.date);

      if (!meses.containsKey(mes)) {
        meses[mes] = {
          'valueCost': 0.0,
          'valueEntrance': 0.0,
          'valueTotal': 0.0,
        };
      }

      if (transacao.value < 0) {
        meses[mes]['valueCost'] += (transacao.value * -1.0);
      } else {
        meses[mes]['valueEntrance'] += transacao.value;
      }

      meses[mes]['valueTotal'] =
          meses[mes]['valueEntrance'] + meses[mes]['valueCost'];
    }

    return meses;
  }

  @action
  void saveValues() {
    final requestModel = TransactionModel(
        value: double.tryParse(valueController.text)!,
        title: titleController.text,
        description: descriptionController.text,
        category: categoryController,
        date: dateController);
    addTransactionUseCase(requestModel);
    valueController.clear();
    titleController.clear();
    descriptionController.clear();
    categoryController = '';
    dateController = DateTime.now();
  }
}