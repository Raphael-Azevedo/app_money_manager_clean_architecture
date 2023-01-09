import 'package:money_manager/features/home/data/datasources/interface/home_remote_datasource.dart';
import 'package:money_manager/features/home/domain/entities/transactions.dart';
import 'package:money_manager/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:money_manager/features/home/domain/repositories/home_repository.dart';

import '../../../../core/error/exceptions.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

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
}
