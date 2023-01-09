import 'package:dartz/dartz.dart';
import 'package:money_manager/core/error/failures.dart';
import 'package:money_manager/features/home/data/models/transaction_model.dart';
import 'package:money_manager/features/home/domain/entities/transactions.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Transaction>>>? getMonthTransactionList();
  Future<Either<Failure, List<Transaction>>>? getYearTransactionList();
  Future<Either<Failure, Map<String, dynamic>>> addTransaction(TransactionModel params);
}
