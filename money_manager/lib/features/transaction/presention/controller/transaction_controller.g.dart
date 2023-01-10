// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionController on _TransactionControllerBase, Store {
  late final _$filteredListAtom =
      Atom(name: '_TransactionControllerBase.filteredList', context: context);

  @override
  List<dynamic> get filteredList {
    _$filteredListAtom.reportRead();
    return super.filteredList;
  }

  @override
  set filteredList(List<dynamic> value) {
    _$filteredListAtom.reportWrite(value, super.filteredList, () {
      super.filteredList = value;
    });
  }

  late final _$selectedFilterAtom =
      Atom(name: '_TransactionControllerBase.selectedFilter', context: context);

  @override
  int get selectedFilter {
    _$selectedFilterAtom.reportRead();
    return super.selectedFilter;
  }

  @override
  set selectedFilter(int value) {
    _$selectedFilterAtom.reportWrite(value, super.selectedFilter, () {
      super.selectedFilter = value;
    });
  }

  late final _$isBusyAtom =
      Atom(name: '_TransactionControllerBase.isBusy', context: context);

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
      Atom(name: '_TransactionControllerBase.valueTotal', context: context);

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
      Atom(name: '_TransactionControllerBase.valueEntrance', context: context);

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
      Atom(name: '_TransactionControllerBase.valueCost', context: context);

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

  late final _$chartBarAtom =
      Atom(name: '_TransactionControllerBase.chartBar', context: context);

  @override
  Map<String, dynamic> get chartBar {
    _$chartBarAtom.reportRead();
    return super.chartBar;
  }

  @override
  set chartBar(Map<String, dynamic> value) {
    _$chartBarAtom.reportWrite(value, super.chartBar, () {
      super.chartBar = value;
    });
  }

  late final _$transactionListAtom = Atom(
      name: '_TransactionControllerBase.transactionList', context: context);

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

  late final _$allTransactionListAtom = Atom(
      name: '_TransactionControllerBase.allTransactionList', context: context);

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
      '_TransactionControllerBase.getMonthTransactionList',
      context: context);

  @override
  Future<void> getMonthTransactionList() {
    return _$getMonthTransactionListAsyncAction
        .run(() => super.getMonthTransactionList());
  }

  late final _$getAllTransactionsAsyncAction = AsyncAction(
      '_TransactionControllerBase.getAllTransactions',
      context: context);

  @override
  Future<void> getAllTransactions() {
    return _$getAllTransactionsAsyncAction
        .run(() => super.getAllTransactions());
  }

  late final _$_TransactionControllerBaseActionController =
      ActionController(name: '_TransactionControllerBase', context: context);

  @override
  void saveValues() {
    final _$actionInfo = _$_TransactionControllerBaseActionController
        .startAction(name: '_TransactionControllerBase.saveValues');
    try {
      return super.saveValues();
    } finally {
      _$_TransactionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatedListTransaction(int filter) {
    final _$actionInfo = _$_TransactionControllerBaseActionController
        .startAction(name: '_TransactionControllerBase.updatedListTransaction');
    try {
      return super.updatedListTransaction(filter);
    } finally {
      _$_TransactionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filteredList: ${filteredList},
selectedFilter: ${selectedFilter},
isBusy: ${isBusy},
valueTotal: ${valueTotal},
valueEntrance: ${valueEntrance},
valueCost: ${valueCost},
chartBar: ${chartBar},
transactionList: ${transactionList},
allTransactionList: ${allTransactionList}
    ''';
  }
}
