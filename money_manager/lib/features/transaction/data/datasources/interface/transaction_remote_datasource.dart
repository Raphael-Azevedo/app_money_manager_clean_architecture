import 'package:money_manager/features/transaction/data/models/transaction_model.dart';

abstract class TransactionRemoteDataSource {
  Future<List<TransactionModel>> getMonthTransactionList();
  Future<List<TransactionModel>> getYearTransactionList();
  Future<Map<String, dynamic>> addTransaction(TransactionModel params);
}
