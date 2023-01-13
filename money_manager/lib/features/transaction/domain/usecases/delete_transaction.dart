import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/transaction_model.dart';
import '../entities/transactions.dart';
import '../repositories/transaction_repository.dart';

class DeleteTransaction implements UseCaseSingle<Transaction, TransactionModel> {
  final TransactionRepository repository;

  DeleteTransaction(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>>?> call(params) async {
    final requestModel = TransactionModel(
        id: params.id,
        value: params.value,
        title: params.title,
        description: params.description,
        category: params.category,
        date: params.date);

    final result = await repository.deleteTransaction(requestModel);
    return result;
  }
}
