import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/features/home/domain/usecases/get_month_transaction_list.dart';
import 'package:money_manager/features/home/domain/usecases/get_year_transaction_list.dart';

import '../../../../core/dependency_injection/injection_container.dart';
import '../../domain/entities/transactions.dart';

part 'home_controller.g.dart';

// ignore: library_private_types_in_public_api
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  late final GetMonthTransactionList getMonthTransactionListUseCase;
  late final GetYearTransactionList getYearTransactionListUseCase;

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

  _HomeControllerBase(
      {required this.getMonthTransactionListUseCase,
      required this.getYearTransactionListUseCase});

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
}
