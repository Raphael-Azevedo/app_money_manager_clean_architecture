import 'package:money_manager/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:money_manager/features/transaction/domain/entities/transactions.dart';
import 'package:money_manager/features/transaction/domain/repositories/transaction_repository.dart';

import '../../../../core/usecases/usecase.dart';

class GetMonthTransactionList implements UseCase<Transaction, NoParams> {
  final TransactionRepository repository;

  GetMonthTransactionList(this.repository);

  @override
  Future<Either<Failure, List<Transaction>>?> call(NoParams params) async {
    return await repository.getMonthTransactionList();
  }
}
