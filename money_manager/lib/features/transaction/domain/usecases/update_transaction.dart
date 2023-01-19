import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/transaction_model.dart';
import '../entities/transactions.dart';
import '../repositories/transaction_repository.dart';

class UpdateTransaction
    implements UseCaseSingle<Transaction, TransactionModel> {
  final TransactionRepository repository;

  UpdateTransaction(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>>?> call(params) async {
    final requestModel = TransactionModel(params.timestamp, params.eTag,
        rowKey: params.rowKey,
        value: params.value,
        title: params.title,
        description: params.description,
        category: params.category,
        date: params.date);

    final result = await repository.updateTransaction(requestModel);
    return result;
  }
}
