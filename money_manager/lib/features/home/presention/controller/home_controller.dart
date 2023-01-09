import 'package:flutter/material.dart';
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
      transactionList = ObservableList.of(r);
    });
  }
}
