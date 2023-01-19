import 'package:money_manager/features/transaction/data/datasources/interface/transaction_remote_datasource.dart';
import 'package:money_manager/features/transaction/data/models/transaction_model.dart';
import 'package:money_manager/features/transaction/domain/entities/transactions.dart';
import 'package:money_manager/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:money_manager/features/transaction/domain/repositories/transaction_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../models/transaction_add_model.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  final TransactionRemoteDataSource remoteDataSource;

  TransactionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Transaction>>>? getMonthTransactionList() async {
    try {
      final remoteTransactions =
          await remoteDataSource.getMonthTransactionList();
      return Right(remoteTransactions);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Transaction>>>? getYearTransactionList() async {
    try {
      final remoteTransactions =
          await remoteDataSource.getYearTransactionList();
      return Right(remoteTransactions);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> addTransaction(
      TransactionAddModel params) async {
    try {
      final response = await remoteDataSource.addTransaction(params);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> deleteTransaction(
      TransactionModel params) async {
    try {
      final response = await remoteDataSource.deleteTransaction(params);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateTransaction(
      TransactionModel params) async {
    try {
      final response = await remoteDataSource.updateTransaction(params);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
