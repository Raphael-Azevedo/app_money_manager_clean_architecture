import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/transactions.dart';
import '../repositories/transaction_repository.dart';

class GetYearTransactionList implements UseCase<Transaction, NoParams> {
  final TransactionRepository repository;

  GetYearTransactionList(this.repository);

  @override
  Future<Either<Failure, List<Transaction>>?> call(NoParams params) async {
    return await repository.getYearTransactionList();
  }
}