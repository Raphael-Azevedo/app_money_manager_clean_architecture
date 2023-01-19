import 'package:money_manager/features/transaction/data/models/transaction_model.dart';

import '../../models/transaction_add_model.dart';

abstract class TransactionRemoteDataSource {
  Future<List<TransactionModel>> getMonthTransactionList();
  Future<List<TransactionModel>> getYearTransactionList();
  Future<Map<String, dynamic>> addTransaction(TransactionAddModel params);
  Future<Map<String, dynamic>> updateTransaction(TransactionModel params);
  Future<Map<String, dynamic>> deleteTransaction(TransactionModel params);

}
