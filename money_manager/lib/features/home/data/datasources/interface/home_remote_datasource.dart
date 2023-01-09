import 'package:money_manager/features/home/data/models/transaction_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<TransactionModel>> getMonthTransactionList();
  Future<List<TransactionModel>> getYearTransactionList();
}
