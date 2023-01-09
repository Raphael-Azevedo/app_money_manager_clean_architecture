import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/transactions.dart';
import '../repositories/home_repository.dart';

class GetYearTransactionList implements UseCase<Transaction, NoParams> {
  final HomeRepository repository;

  GetYearTransactionList(this.repository);

  @override
  Future<Either<Failure, List<Transaction>>?> call(NoParams params) async {
    return await repository.getYearTransactionList();
  }
}