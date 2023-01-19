import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/features/transaction/domain/usecases/add_transaction.dart';
import 'package:money_manager/features/transaction/domain/usecases/get_month_transaction_list.dart';
import 'package:money_manager/features/transaction/domain/usecases/get_year_transaction_list.dart';

import '../../../../core/dependency_injection/injection_container.dart';
import '../../data/models/transaction_add_model.dart';
import '../../data/models/transaction_model.dart';
import '../../domain/entities/transactions.dart';
import '../../domain/usecases/delete_transaction.dart';
import '../../domain/usecases/update_transaction.dart';
import '../view_model/transaction_view_model.dart';

part 'transaction_controller.g.dart';

// ignore: library_private_types_in_public_api
class TransactionController = _TransactionControllerBase
    with _$TransactionController;

abstract class _TransactionControllerBase with Store {
  late final GetMonthTransactionList getMonthTransactionListUseCase;
  late final GetYearTransactionList getYearTransactionListUseCase;
  late final AddTransaction addTransactionUseCase;
  late final UpdateTransaction updateTransactionUseCase;
  late final DeleteTransaction deleteTransactionUseCase;

  _TransactionControllerBase(
      {required this.getMonthTransactionListUseCase,
      required this.getYearTransactionListUseCase,
      required this.addTransactionUseCase,
      required this.updateTransactionUseCase,
      required this.deleteTransactionUseCase});

  TransactionViewModel transaction = TransactionViewModel("", "",
      rowKey: "",
      value: TextEditingController(),
      title: TextEditingController(),
      description: TextEditingController(),
      category: "",
      date: DateTime.now());

  BuildContext? buildContext;

  @observable
  List filteredList = [];

  @observable
  int selectedFilter = 0;

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

  @action
  Future<void> getMonthTransactionList() async {
    final result = await getMonthTransactionListUseCase(sl());
    result!.fold((l) {}, (r) {
      transactionList = ObservableList.of(r);
      transactionList.sort((a, b) => b.date.compareTo(a.date));
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
      allTransactionList.sort((a, b) => b.date.compareTo(a.date));
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
  Future<void> saveValues() async {
    final value = transaction.value.text;
    final requestModel = TransactionAddModel(
        transaction.timestamp, transaction.eTag,
        rowKey: "",
        value: double.tryParse(value) ?? 0.0,
        title: transaction.title.text,
        description: transaction.description.text,
        category: transaction.category,
        date: transaction.date);
    await addTransactionUseCase(requestModel);
    clearController();
  }

  @action
  Future<void> deleteValues() async {
    await deleteTransactionUseCase(getTransactionModel());
    clearController();
  }

  @action
  Future<void> updateValues() async {
    await updateTransactionUseCase(getTransactionModel());
    clearController();
  }

  @action
  void updatedListTransaction(int filter) {
    selectedFilter = filter;
    filterTransactions();
  }

  void clearController() {
    transaction = TransactionViewModel("", "",
        rowKey: "",
        value: TextEditingController(),
        title: TextEditingController(),
        description: TextEditingController(),
        category: "",
        date: DateTime.now());
  }

  void filterTransactions() {
    switch (selectedFilter) {
      case 0: // ano
        filteredList = allTransactionList
            .where((t) => t.date.year == DateTime.now().year)
            .toList();
        break;
      case 1: // mês
        filteredList = allTransactionList
            .where((t) => t.date.month == DateTime.now().month)
            .toList();
        break;
      case 2: // dia
        filteredList = allTransactionList
            .where((t) => t.date.day == DateTime.now().day)
            .toList();
        break;
    }
  }

  Future<void> initializeController() async {
    await Future.wait([
      getMonthTransactionList(),
      getAllTransactions(),
    ]);
  }

  TransactionModel getTransactionModel() {
    final value = transaction.value.text;
    final requestModel = TransactionModel(
        transaction.timestamp, transaction.eTag,
        rowKey: transaction.rowKey,
        value: double.tryParse(value) ?? 0.0,
        title: transaction.title.text,
        description: transaction.description.text,
        category: transaction.category,
        date: transaction.date);
    return requestModel;
  }
}
