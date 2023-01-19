import 'package:money_manager/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:money_manager/features/transaction/domain/entities/transactions.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/models/transaction_add_model.dart';
import '../repositories/transaction_repository.dart';

class AddTransaction implements UseCaseSingle<Transaction, TransactionAddModel> {
  final TransactionRepository repository;

  AddTransaction(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>>?> call(params) async {
    final requestModel = TransactionAddModel(DateTime.now().toIso8601String(), "",
        rowKey: const Uuid().v4(),
        value: params.value,
        title: params.title,
        description: params.description,
        category: params.category,
        date: params.date);

    final result = await repository.addTransaction(requestModel);
    return result;
  }
}
