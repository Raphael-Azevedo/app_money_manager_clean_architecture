// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$isBusyAtom =
      Atom(name: '_HomeControllerBase.isBusy', context: context);

  @override
  bool get isBusy {
    _$isBusyAtom.reportRead();
    return super.isBusy;
  }

  @override
  set isBusy(bool value) {
    _$isBusyAtom.reportWrite(value, super.isBusy, () {
      super.isBusy = value;
    });
  }

  late final _$valueTotalAtom =
      Atom(name: '_HomeControllerBase.valueTotal', context: context);

  @override
  double get valueTotal {
    _$valueTotalAtom.reportRead();
    return super.valueTotal;
  }

  @override
  set valueTotal(double value) {
    _$valueTotalAtom.reportWrite(value, super.valueTotal, () {
      super.valueTotal = value;
    });
  }

  late final _$valueEntranceAtom =
      Atom(name: '_HomeControllerBase.valueEntrance', context: context);

  @override
  double get valueEntrance {
    _$valueEntranceAtom.reportRead();
    return super.valueEntrance;
  }

  @override
  set valueEntrance(double value) {
    _$valueEntranceAtom.reportWrite(value, super.valueEntrance, () {
      super.valueEntrance = value;
    });
  }

  late final _$valueCostAtom =
      Atom(name: '_HomeControllerBase.valueCost', context: context);

  @override
  double get valueCost {
    _$valueCostAtom.reportRead();
    return super.valueCost;
  }

  @override
  set valueCost(double value) {
    _$valueCostAtom.reportWrite(value, super.valueCost, () {
      super.valueCost = value;
    });
  }

  late final _$transactionListAtom =
      Atom(name: '_HomeControllerBase.transactionList', context: context);

  @override
  List<Transaction> get transactionList {
    _$transactionListAtom.reportRead();
    return super.transactionList;
  }

  @override
  set transactionList(List<Transaction> value) {
    _$transactionListAtom.reportWrite(value, super.transactionList, () {
      super.transactionList = value;
    });
  }

  late final _$allTransactionListAtom =
      Atom(name: '_HomeControllerBase.allTransactionList', context: context);

  @override
  List<Transaction> get allTransactionList {
    _$allTransactionListAtom.reportRead();
    return super.allTransactionList;
  }

  @override
  set allTransactionList(List<Transaction> value) {
    _$allTransactionListAtom.reportWrite(value, super.allTransactionList, () {
      super.allTransactionList = value;
    });
  }

  late final _$getMonthTransactionListAsyncAction = AsyncAction(
      '_HomeControllerBase.getMonthTransactionList',
      context: context);

  @override
  Future<void> getMonthTransactionList() {
    return _$getMonthTransactionListAsyncAction
        .run(() => super.getMonthTransactionList());
  }

  late final _$getAllTransactionsAsyncAction =
      AsyncAction('_HomeControllerBase.getAllTransactions', context: context);

  @override
  Future<void> getAllTransactions() {
    return _$getAllTransactionsAsyncAction
        .run(() => super.getAllTransactions());
  }

  @override
  String toString() {
    return '''
isBusy: ${isBusy},
valueTotal: ${valueTotal},
valueEntrance: ${valueEntrance},
valueCost: ${valueCost},
transactionList: ${transactionList},
allTransactionList: ${allTransactionList}
    ''';
  }
}
