import 'package:dartz/dartz.dart';
import 'package:money_manager/core/error/failures.dart';
import 'package:money_manager/features/transaction/data/models/transaction_model.dart';
import 'package:money_manager/features/transaction/domain/entities/transactions.dart';

import '../../data/models/transaction_add_model.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<Transaction>>>? getMonthTransactionList();
  Future<Either<Failure, List<Transaction>>>? getYearTransactionList();
  Future<Either<Failure, Map<String, dynamic>>> addTransaction(TransactionAddModel params);
  Future<Either<Failure, Map<String, dynamic>>> updateTransaction(TransactionModel params);
  Future<Either<Failure, Map<String, dynamic>>> deleteTransaction(TransactionModel params);

}
